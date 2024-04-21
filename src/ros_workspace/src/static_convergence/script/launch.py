import subprocess


def run_command(command):
    # Run the command in a subprocess
    process = subprocess.Popen(command, shell=True)

    # Wait for subprocess to finish
    process.wait()


def main():
    input_directory = "/home/quentin/Dev/iridia-dwm/src/ros_workspace/src/static_convergence/script/output/raw_data"
    output_directory = "/home/quentin/Dev/iridia-dwm/src/ros_workspace/src/static_convergence/script/output/convergence/certainty_mds"
    seed = 42

    for i in range(1, 2):
        arguments = ""

        arguments += f" random_seed:=\"{seed}\""

        arguments += f" input_dir:=\"{input_directory}\""
        arguments += f" input_file:=\"raw_data_robot_4_try_3_delay_0_batch_{i}\""

        arguments += f" output_dir:=\"{output_directory}\""
        arguments += f" output_file:=\"static_convergence_seed_{seed}_robot_4_try_3_delay_0_batch_{i}\""

        print(arguments)

        run_command(f"echo start_{i}")
        run_command("roslaunch static_convergence static_convergence_experiment.launch" + arguments)
        run_command("echo end")

    run_command("echo \"experiments finished\"")


if __name__ == "__main__":
    main()
