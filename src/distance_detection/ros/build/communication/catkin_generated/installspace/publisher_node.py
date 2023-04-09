#!/usr/bin/env python3
import rospy
# from std_msgs.msg import String
from communication.msg import Distance

def talker():
    pub = rospy.Publisher('chatter', Distance, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        msg = Distance()
        msg.robot_id = 3
        msg.distance = 2.3

        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass