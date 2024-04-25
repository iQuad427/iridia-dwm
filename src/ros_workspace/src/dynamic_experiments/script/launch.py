import os
import subprocess


def run_command(command):
    # Run the command in a subprocess
    process = subprocess.Popen(command, shell=True)

    # Wait for subprocess to finish
    process.wait()


def main():
    input_directory = "/home/quentin/Dev/iridia-dwm/src/ros_workspace/src/static_convergence/script/output/raw_data"
    output_directory = "/home/quentin/Dev/iridia-dwm/src/ros_workspace/src/static_convergence/script/output/total"
    seed = 124

    print("STARTING...")

    count = 0
    try:
        os.mkdir(output_directory)
    except FileExistsError:
        pass

    for init in [True, False]:
        for offset in [True, False]:
            for certainty in [True, False]:
                count += 1

                output_dir = f"{output_directory}/static_convergence"
                output_dir += f"_init" if init else ""
                output_dir += f"_offset" if offset else ""
                output_dir += f"_certainty" if certainty else ""

                try:
                    os.mkdir(output_dir)
                except FileExistsError:
                    # If one file in the directory contains the "seed_{seed}" string, skip the experiment
                    if any(f"seed_{seed}" in file for file in os.listdir(output_dir)):
                        print(f"static_convergence_init_{init}_offset_{offset}_certainty_{certainty} skipped.")
                        continue

                for batch in range(1, 6):
                    print(
                        f"{count}/8 : init = {init}, offset = {offset}, certainty = {certainty}, batch = {batch}"
                    )

                    arguments = ""

                    # arguments += f" experiment_duration:=\"5\""

                    arguments += f" random_seed:=\"{seed}\""

                    arguments += f" input_dir:=\"{input_directory}\""
                    arguments += f" input_file:=\"raw_data_robot_4_try_3_delay_0_batch_{batch}\""

                    arguments += f" output_dir:=\"{output_dir}\""
                    arguments += f" output_file:=\"seed_{seed}_robot_4_try_3_delay_0_batch_{batch}\""

                    arguments += f" init:=\"{init}\""
                    arguments += f" offset:=\"{offset}\""
                    arguments += f" certainty:=\"{certainty}\""

                    run_command("roslaunch static_convergence static_convergence_experiment.launch" + arguments)

    print("FINISHED")


if __name__ == "__main__":
    main()
