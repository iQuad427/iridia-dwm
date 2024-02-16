
import serial
import rospy


class DWM:
    def __init__(self, port):
        self.dwm = serial.Serial()
        self.dwm.port = port
        self.dwm.baudrate = 115200

        self.dwm.bytesize = serial.EIGHTBITS
        self.dwm.parity = serial.PARITY_NONE
        self.dwm.stopbits = serial.STOPBITS_ONE
        self.dwm.timeout = 1
        self.dwm.write_timeout = 0

        self.open()

    def open(self):
        self.dwm.open()

    def close(self):
        self.dwm.close()

    def read(self):
        self.dwm.readline()

    def write(self, string):
        self.dwm.write(str.encode(string, encoding="utf-8"))


def talker():
    pub = rospy.Publisher('distance_polling', Distances, queue_size=10)
    rospy.init_node('talker', anonymous=True)

    rate = rospy.Rate(10)  # 10hz

    responder = DWM('/dev/ttyACM0')

    while not rospy.is_shutdown():
        # TODO: read SPI and publish into ROS topic
        pass


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
