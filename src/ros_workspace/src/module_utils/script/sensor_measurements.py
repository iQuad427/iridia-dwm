#!/usr/bin/python3
import datetime
import signal
import sys

import serial
import rospy
import numpy as np
import tqdm
from ros_utils.msg import Manage, Distance, Distances


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


def signal_handler(sig, frame):
    global stop
    stop = True


def parse_message(line: str) -> Distances:
    msg = Distances()
    msg.ranges = []

    faulty_frame = False

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
            except ValueError as e:
                pass

    return msg, faulty_frame


def talker():
    simulation = True if sys.argv[1] == "True" else False

    output_dir = sys.argv[2]
    output_file = sys.argv[3]

    rospy.init_node('sensor_measurement', anonymous=True)

    # Subscribe to the manager command (to stop the node when needed)
    rospy.Subscriber('manager_command', Manage, callback)

    # Publish the read distances
    publisher = rospy.Publisher('sensor_read', Distances, queue_size=10)

    if not simulation:
        try:
            responder = DWM('/dev/ttyACM1')
        except serial.SerialException as e:
            raise ValueError("Couldn't open serial port", e)

        start = datetime.datetime.now()

        with open(f"{output_dir}/{output_file}", "w+") as f:
            while not rospy.is_shutdown() and not stop:
                line: str = responder.read()

                f.write(f"{(datetime.datetime.now() - start).total_seconds()}&{line}")
                msg, faulty_frame = parse_message(line)

                if not faulty_frame:
                    publisher.publish(msg)

    else:
        start = datetime.datetime.now()

        with open(f"{output_dir}/{output_file}", "r") as f:
            # Read file, line by line and output only if timestamp is reached
            lines = f.readlines()

        for line in tqdm.tqdm(lines):
            msg, faulty_frame = parse_message(line.split("&")[1])
            if not faulty_frame:
                # While not the right moment, do nothing
                while (datetime.datetime.now() - start).total_seconds() < float(line.split("&")[0]):
                    pass

                publisher.publish(msg)
            if stop:
                break


if __name__ == '__main__':
    # Set signal handler
    signal.signal(signal.SIGINT, signal_handler)

    try:
        talker()
    except rospy.ROSInterruptException:
        pass
