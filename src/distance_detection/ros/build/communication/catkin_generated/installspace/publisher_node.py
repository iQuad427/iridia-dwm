#!/usr/bin/env python3
import rospy
import serial
import copy
from communication.msg import Distance


DEVICE_PORT = '/dev/ttyACM0'
DEVICE_BAUDRATE = 115200
DEVICE_BYTESIZE = serial.EIGHTBITS
DEVICE_PARITY = serial.PARITY_NONE
DEVICE_STOPBITS = serial.STOPBITS_ONE
DEVICE_TIMEOUT = 1

COLORS = {
    'R' : "red",
    'B' : "blue",
    'G' : "green",
    'Y' : "yellow",
    'b' : "black",
    'g' : "grey"
}


class DWM1001:
    def __init__(self, port=None):
        try:
            device = serial.Serial()
            device.port = DEVICE_PORT if port is None else port
            device.baudrate = DEVICE_BAUDRATE
            device.bytesize = DEVICE_BYTESIZE
            device.parity = DEVICE_PARITY
            device.stopbits = DEVICE_STOPBITS
            device.timeout = DEVICE_TIMEOUT
            device.write_timeout = 0
            device.open()
            print("Device successfully connected")
            self.device = device

        except Exception as e:
            print(e)
            print("Could not connect to device on port '" + DEVICE_PORT + "'")
            quit()
    
    def close(self):
        self.device.close()
        print("Connection with the device closed")
    
    def write(self, string):
        self.device.write(bytes(string, encoding='utf-8'))

    def get_output(self):
        return str(self.device.readline(), 'utf-8')

    def show_output(self):
        while True:
            output = self.get_output()
            if output != '':
                print(output, end='')
    
    def write(self, string):
        self.device.write(bytes(string, encoding='utf-8'))
        

def talker():
    pub = rospy.Publisher('distance_polling', Distance, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz

    device = DWM1001('/dev/ttyACM0')
    # responder = DWM1001('/dev/ttyACM1')

    id = input("Enter module ID : ")
    device.write(id) # robot own id
    # responder.write(id)

    agents = set()
    agents.add('A') # adding broadcast address (ALL) to find other agents

    while not rospy.is_shutdown():
        for robot_id in copy.copy(agents):
            if robot_id == id:
                continue

            device.write(robot_id) # ask to poll for distance to robot_id

            out = device.get_output()
            rospy.loginfo(f"{out[:-2]}")

            res = out.split(' : ')
            if len(res) == 3:
                agents.add(res[0])

                msg = Distance()
                msg.robot_id = int(res[0])
                msg.distance = float(res[1])
                msg.color = COLORS[str(res[2])[0]]

                pub.publish(msg)

            


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass