#!/usr/bin/python3
import sys

import serial
import rospy
import numpy as np
from trilateration.msg import Distance, Distances, Manage


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


stop = False


def callback(msg):
    global stop
    if msg.stop:
        stop = True


def talker():

    output_dir = sys.argv[1]
    output_file = sys.argv[2]

    rospy.init_node('sensor_measurement', anonymous=True)
    manager = rospy.Subscriber('manager_command', Manage, callback)

    try:
        responder = DWM('/dev/ttyACM0')
    except serial.SerialException as e:
        print("Failed!")
        print(e)
        exit(1)

    with open(f"{output_dir}/{output_file}", "w+") as f:
        while not rospy.is_shutdown() and not stop:

            line: str = responder.read()

            infos = line.split(" : ")

            if len(infos) > 1:  # Means that the split was made (therefore at least one information to process)
                sender_robot = infos[0]
                distance = infos[1]

                f.write(distance)


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
