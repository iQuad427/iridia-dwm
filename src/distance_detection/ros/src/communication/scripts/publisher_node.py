#!/usr/bin/env python3
import rospy
import copy
from communication.msg import Distance
from dwm1001 import DWM1001


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
                
                if len(res[2]) > 1:
                    msg.color = str(res[2])[0]
                else:
                    msg.color = 'g'

                pub.publish(msg)

            


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
