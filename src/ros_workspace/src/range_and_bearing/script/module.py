import serial

import numpy as np


def add_noise(number: int):
    return number + int(np.random.normal(0, 10))


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


class FakeDWM:
    """
    B-----1m----C
    |           |
    |           |
    1m          1m
    |           |
    D-----1m----E
    """
    def __init__(self):
        self.counter = 0
        self.messages = [
            "B=0:100,C=100:100,D=100:100,E=141:100,",
            "C=0:100,B=100:100,D=141:100,E=100:100,",
            "D=0:100,B=100:100,C=141:100,E=100:100,",
            "E=0:100,B=141:100,C=100:100,D=100:100,"
        ]

    def update_noise(self):
        self.messages = [
            f"B=0:100,C={add_noise(100)}:100,D={add_noise(100)}:100,E={add_noise(141)}:100,",
            f"C=0:100,B={add_noise(100)}:100,D={add_noise(141)}:100,E={add_noise(100)}:100,",
            f"D=0:100,B={add_noise(100)}:100,C={add_noise(141)}:100,E={add_noise(100)}:100,",
            f"E=0:100,B={add_noise(141)}:100,C={add_noise(100)}:100,D={add_noise(100)}:100,"
        ]

    def next(self):
        self.counter += 1
        if self.counter % 100 == 0:
            self.update_noise()
        return self.counter % 4

    def read(self):
        return self.messages[self.next()]
