import dataclasses
import datetime
from pathlib import Path
from typing import List

import numpy as np
import matplotlib.pyplot as plt

from utils import rotate_and_translate

from tqdm import tqdm


@dataclasses.dataclass
class Position:
    id: int
    x: float
    y: float

    def __repr__(self):
        return f"{self.id},{self.x},{self.y}"


@dataclasses.dataclass
class Memory:
    positions: List[Position]
    timestamp: datetime.datetime

    def __repr__(self):
        buffer = f"{self.timestamp}&"
        for position in self.positions:
            buffer += f"{position}#"

        return buffer[:-1]


class FileReader:
    """
    Read a file like the following :
    type=relative_time=time&id,x,y#id,x,y#id,x,y#id,x,y ...

    And allow for doing some operations on it.
    """

    def __init__(self, file_path):
        self.file_path = file_path
        self.file_name = file_path.split("/")[-1]
        self.data, self.time = self._read_file(file_path)

    def _read_file(self, file_path):
        with open(file_path, "r") as f:
            lines = f.readlines()

        data = []
        time = []
        # By stem of 2 because we have 2 lines for each time
        for j in range(0, len(lines), 2):
            estimation_line = lines[j].split("\n")[0].split("=")
            simulation_line = lines[j + 1].split("\n")[0].split("=")

            time.append(float(estimation_line[1]))
            time_step = []

            for line in [estimation_line, simulation_line]:
                positions = line[2].split("&")[1].split("#")
                positions = [position.split(",") for position in positions]
                positions = [
                    Position(int(position[0]), float(position[1]), float(position[2])) for position in positions
                ]
                time_step.append(
                    Memory(
                        positions,
                        datetime.datetime.strptime(line[2].split("&")[0], "%Y-%m-%d %H:%M:%S.%f")
                    )
                )

            data.append(time_step)

        return data, time

    def make_numpy(self):
        data = []

        for step in self.data:
            estimation = np.array([[position.x, position.y] for position in step[0].positions])
            simulation = np.array([[position.x, position.y] for position in step[1].positions])

            data.append([estimation, simulation])

        return data


if __name__ == '__main__':
    # Seed 1 : 124
    # Seed 2 : 042
    # Seed 3 : 427
    # Seed 4 : 097
    # Seed 5 : 172

    limit = 200  # 300 => 60 seconds
    flip_test = True
    file_directory = f"./output/total"

    mds = False
    pf = True

    plot_grid = False

    time = np.arange(0, limit) / 5

    last_estimation = None
    last_simulation = None

    plt.figure(figsize=(10, 5))

    # List of all combination of three False/True combinations
    experiments = []
    if mds:
        for i in [False, True]:
            for j in [False, True]:
                for k in [False, True]:
                    output_dir = f"static_convergence_mds"
                    output_dir += f"_init" if i else ""
                    output_dir += f"_offset" if j else ""
                    output_dir += f"_certainty" if k else ""

                    experiments.append(output_dir)

    if pf:
        for i in [False, True]:
            for j in [False, True]:
                for k in [False, True]:
                    output_dir = f"static_convergence_pf"
                    output_dir += f"_init" if i else ""
                    output_dir += f"_offset" if j else ""
                    output_dir += f"_certainty" if k else ""

                    experiments.append(output_dir)

    # experiments = [
    #     "static_convergence_mds",
    # ]

    for experiment in experiments:
        directory = f"{file_directory}/{experiment}"

        path = Path(directory)
        if not path.is_dir():
            continue

        mean_square_error = []

        # Read the file
        for batch in range(1, 6):
            if "_mds" in directory:
                file_name = f"seed_42_robot_4_try_3_delay_0_batch_{batch}"
            elif "_pf" in directory:
                file_name = f"seed_42_robot_4_try_3_delay_0_particle_5000_dt_0.1_err_15_batch_{batch}"
            else:
                raise ValueError("Directory name doesn't match expectations")

            try:
                file_reader = FileReader(f"{directory}/{file_name}")
            except:
                print(f"Couldn't read {file_name}")
                continue

            mses = []
            flips = []

            print("[0] File :", file_reader.file_path)
            print("[0] File name :", file_reader.file_name)

            for est, sim in file_reader.make_numpy():
                est, flip = rotate_and_translate(sim, est)
                mse = np.mean(np.square(est - sim))

                if batch == 5:
                    last_estimation = est
                    last_simulation = sim

                mses.append(mse)
                flips.append(flip)

            # If MSEs is shorter than limit, add last value to fill up
            while len(mses) < limit:
                mses = mses + [mses[-1]]

            mses = mses[:limit]
            flips = flips[:limit]

            flips = np.array(flips)

            filtered_time = [time[i] for i in range(len(flips)) if flips[i]]
            filtered_mses = [mses[i] for i in range(len(flips)) if flips[i]]

            # plt.plot(time, mses[:limit], label=f"Batch {batch}: {len(filtered_time)}/{len(flips)}", alpha=0.5)
            # plt.scatter(filtered_time, filtered_mses, c="r", s=1)

            mean_square_error.append(mses)

        if not mean_square_error:  # or not flipped_mean_square_error:
            raise ValueError("Nothing to plot")

        # Average the result for each time_step
        mean_square_error = np.mean(np.array(mean_square_error), axis=0)

        # Plot the Mean Square Error
        label = ", ".join(experiment.split("_")[2:])
        plt.plot(time, mean_square_error[:limit], label=label)

    # Plot a grid under the plot
    if plot_grid:
        plt.grid(True)

        plt.scatter(last_estimation[:, 0], last_estimation[:, 1], c="r", label="Estimation")
        for i, p in enumerate(last_estimation):
            plt.text(p[0] + 1, p[1] + 1, i, c="r")

        plt.scatter(last_simulation[:, 0], last_simulation[:, 1], c="b", label="Reality")
        for i, p in enumerate(last_simulation):
            plt.text(p[0] + 1, p[1] + 1, i, c="b")

        # Axis labels
        plt.xlabel("X-axis (cm)")
        plt.ylabel("Y-axis (cm)")

        # Equal ratio
        plt.axis('equal')

        plt.title(f"Wrongly Estimated Positions (4 Static Agents, MDS)")
        plt.legend()
        plt.savefig(f"./output/mse_static_positions" + ".png", dpi=300)
    else:
        # Axis labels
        plt.xlabel("Time (s)")
        plt.ylabel("Mean Square Error (cm²)")
        plt.title(f"MSE of Positions (4 Static Agents, Particle Filter, 5000 Particles)")
        # plt.title(f"MSE of Positions (4 Static Agents, MDS)")
        plt.legend()
        plt.savefig(f"./output/mse_static_{file_directory.split('/')[-1]}" + ".png", dpi=300)
        # plt.savefig(f"./output/mse_static_pf_5000_particles_seed_42.png", dpi=300)

    plt.show()
