#!/usr/bin/env python3
import rospy
# from std_msgs.msg import String
from communication.msg import Distance

def callback(data):
    rospy.loginfo("Robot : %d, Distance : %f", data.robot_id, data.distance)
    
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("chatter", Distance, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()