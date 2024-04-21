import dataclasses
import datetime
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

            estimation = rotate_and_translate(np.array(simulation), np.array(estimation))

            data.append([estimation, simulation])

        return data


if __name__ == '__main__':
    # Seed 1 : 124
    # Seed 2 : 042
    # Seed 3 : 427
    # Seed 4 : 097
    # Seed 5 : 172

    limit = 300
    flip_test = False
    file_directory = f"../output/experiments/static"

    for error in [0.1, 0.3]:
        for drop in tqdm([0.00, 0.50, 0.90, 0.95, 0.96, 0.97, 0.98, 0.985, 0.99]):
            # Plot the Mean Square Error of the positions
            mean_square_error = []
            time = np.arange(0, limit) / 5

            # Read the file
            for batch in range(1, 6):
                file_name = f"drop_{drop:0.2f}_err_{error}_batch_{batch}" if len(str(drop)) <= len(f"{drop:0.2f}") else f"drop_{drop:0.3f}_err_0.1_speed_30_batch_{batch}"

                try:
                    file_reader = FileReader(f"{file_directory}/{file_name}")
                except:
                    continue

                mses = []

                # print("[0] File :", file_reader.file_path)
                # print("[0] File name :", file_reader.file_name)

                for est, sim in file_reader.make_numpy():
                    mse = np.mean(np.square(est - sim))

                    if flip_test:
                        # Create a third array that is est with all Y values flipped
                        flipped_estimation = np.array([[position[0], -position[1]] for position in est])

                        # Rotate and translate the flipped estimation
                        flipped_estimation = rotate_and_translate(sim, flipped_estimation)

                        # Compare the flipped MSE
                        flipped_mse = np.mean(np.square(flipped_estimation - sim))
                        mse = min(mse, flipped_mse)

                    mses.append(mse)

                # If MSEs is shorter than limit, add last value to fill up
                while len(mses) < limit:
                    mses = mses + [mses[-1]]

                mses = mses[:limit]

                mean_square_error.append(mses)

            if not mean_square_error:
                continue

            # Average the result for each time_step
            mean_square_error = np.mean(np.array(mean_square_error), axis=0)

            # Plot the Mean Square Error
            label = f"Drop rate: {drop:0.2f}" if len(str(drop)) <= len(f"{drop:0.2f}") else f"Drop rate: {drop:0.3f}"
            label_err = f", err: {error}"
            plt.plot(time, mean_square_error[:limit], label=label+label_err)

            # Plot red dots where mean square error is zero
            # for i, mse in enumerate(mean_square_error):
            #     if mse == 0:
            #         plt.scatter(file_reader.time[i], 0, c='r')

    # Axis labels
    plt.xlabel("Time (s)")
    plt.ylabel("Mean Square Error (cm²)")

    plt.title(f"MSE of Positions: {file_directory.split('/')[-2]}, {file_directory.split('/')[-1]}" + ", no_invert" if flip_test else "")
    plt.legend()
    plt.savefig(f"../output/mse_drop_{file_directory.split('/')[-1]}" + "_no_invert" if flip_test else "" + ".png", dpi=300)
    plt.show()
