#!/usr/bin/python3

import time
import rospy
import sys

from trilateration.msg import Manage


def manager():
    experiment_duration = sys.argv[1]

    rospy.init_node('manager', anonymous=True)
    publisher = rospy.Publisher('manager_command', Manage, queue_size=10)

    time.sleep(int(experiment_duration))
    publisher.publish(Manage(stop=True))


if __name__ == '__main__':
    # Enter a function for ROS loop
    try:
        manager()
    except rospy.ROSInterruptException:
        pass
