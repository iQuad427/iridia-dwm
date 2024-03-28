#!/usr/bin/python3

import serial
import rospy
import numpy as np
from trilateration.msg import Distance, Distances
from module import DWM, FakeDWM


def talker():
    pub = rospy.Publisher('distances', Distances, queue_size=10)
    rospy.init_node('talker', anonymous=True)

    rate = rospy.Rate(10)  # 10hz

    try:
        responder = DWM('/dev/ttyACM0')
    except serial.SerialException as e:
        responder = FakeDWM()

    while not rospy.is_shutdown():
        faulty_frame = False

        msg = Distances()

        line: str = responder.read()

        infos = line.split(",")

        if len(infos) > 1:  # Means that the split was made (therefore at least one information to process)
            sender_robot = infos[0]
            sender_info = sender_robot.split("=")

            if sender_info[1] == "0:100":
                msg.robot_id = ord(sender_info[0])

            for info in infos[1:]:
                try:
                    robot, distance = info.split("=")
                    distance, certainty = distance.split(":")

                    data = Distance()

                    data.other_robot_id = ord(robot)
                    data.distance = int(distance)
                    data.certainty = int(certainty)

                    msg.ranges.append(data)
                except ValueError:
                    break

            if not faulty_frame:
                pub.publish(msg)


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
