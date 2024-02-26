#!/usr/bin/python3

import serial
import rospy
import numpy as np
from trilateration.msg import Distance, Distances


def add_noise(number: int):
    return number + int(np.random.normal(10, 10))


class FakeDWM:
    """

    B=====1m====C




    D=====1m====E

    """
    def __init__(self):
        self.counter = 0
        self.messages = [
            "B=0,C=100,D=100,E=141,",
            "C=0,B=100,D=141,E=100,",
            "D=0,B=100,C=141,E=100,",
            "E=0,B=141,C=100,D=100,"
        ]

    def update_noise(self):
        self.messages = [
            f"B=0,C={add_noise(100)},D={add_noise(100)},E={add_noise(141)},",
            f"C=0,B={add_noise(100)},D={add_noise(141)},E={add_noise(100)},",
            f"D=0,B={add_noise(100)},C={add_noise(141)},E={add_noise(100)},",
            f"E=0,B={add_noise(141)},C={add_noise(100)},D={add_noise(100)},"
        ]

    def next(self):
        self.counter += 1
        if self.counter % 100 == 0:
            self.update_noise()
        return self.counter % 4

    def read(self):
        return self.messages[self.next()]


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

    try:
        responder = DWM('/dev/ttyACM0')
    except Exception as e:
        responder = FakeDWM()

    while not rospy.is_shutdown():
        faulty_frame = False

        msg = Distances()

        line: str = responder.read()
        print(line)

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
                    break

            # print(msg)

            if not faulty_frame:
                # print("publishing")
                pub.publish(msg)


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
