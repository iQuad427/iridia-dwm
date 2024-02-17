#!/usr/bin/python3

import serial
import rospy
from trilateration.msg import Distance, Distances


class DWM:
    def __init__(self, port):
        self.serial = serial.Serial()
        self.serial.port = port
        self.serial.baudrate = 115200

        self.serial.bytesize = serial.EIGHTBITS
        self.serial.parity = serial.PARITY_NONE
        self.serial.stopbits = serial.STOPBITS_ONE
        self.serial.timeout = 1
        self.serial.write_timeout = 0

        self.open()

    def open(self):
        self.serial.open()

    def close(self):
        self.serial.close()

    def read(self) -> str:
        return str(self.serial.readline(), 'utf-8')

    def write(self, string):
        self.serial.write(str.encode(string, encoding="utf-8"))


def talker():
    pub = rospy.Publisher('sensor_read', Distances, queue_size=10)
    rospy.init_node('talker', anonymous=True)

    rate = rospy.Rate(10)  # 10hz
    faulty_frame = False

    responder = DWM('/dev/ttyACM0')

    while not rospy.is_shutdown():
        # TODO: read SPI and publish into ROS topic

        msg = Distances()

        line: str = responder.read()

        infos = line.split(",")

        if len(infos) > 1:  # Means that the split was made (therefore at least one information to process)
            sender_robot = infos[0]
            sender_info = sender_robot.split("=")

            if sender_info[1] == "0":
                msg.robot_id = ord(sender_info[0])

            for info in infos[1:]:
                try:
                    robot, distance = info.split("=")

                    data = Distance()

                    data.other_robot_id = ord(robot)
                    data.distance = int(distance)

                    msg.ranges.append(data)
                except ValueError:
                    faulty_frame = True
                    break

            if not faulty_frame:
                pub.publish(msg)


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
