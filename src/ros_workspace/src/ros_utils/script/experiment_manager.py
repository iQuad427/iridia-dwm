#!/usr/bin/python3
import signal
import time
import rospy
import sys

from ros_utils.msg import Manage


compute = True


def signal_handler(sig, frame):
    global compute
    compute = False
    print("Exiting...")


def manager():
    experiment_duration = sys.argv[1]

    rospy.init_node('manager', anonymous=True)
    publisher = rospy.Publisher('manager_command', Manage, queue_size=10)

    start = time.time()

    while time.time() - start < int(experiment_duration) and compute:
        time.sleep(0.1)

    print("Stopping...")

    publisher.publish(Manage(stop=True))


if __name__ == '__main__':
    # Set signal handler
    signal.signal(signal.SIGINT, signal_handler)

    # Enter a function for ROS loop
    try:
        manager()
    except rospy.ROSInterruptException:
        pass
