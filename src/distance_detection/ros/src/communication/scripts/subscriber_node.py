#!/usr/bin/env python3
import rospy
import random
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from communication.msg import Distance


class Robot:
    def __init__(self, identifier=0, distance=-1, color="red"):
        self.id = identifier
        self.distance = distance
        self.color = color

class AnimationPlot:

    def animate(self, robots):
        ax.clear()
        ax.set_rmax(5)
        ax.set_rlabel_position(0)
        ax.grid(color ='grey', linestyle='-', linewidth=0.1)

        for robot in robots:
            if robot.distance != -1:
                plot = plt.Circle((0, 0), robot.distance, transform=ax.transData._b, color=robot.color, fill=False)
                ax.add_artist(plot)

        plt.pause(0.1)


agents = [
    Robot(identifier=0, distance=1, color="red"),
    #Robot(identifier=1, distance=2, color="blue"),
    #Robot(identifier=2, distance=3, color="green"),
    #Robot(identifier=3, distance=4, color="yellow"),
]

def callback(data):
    rospy.loginfo("Robot : %d, Distance : %f", data.robot_id, data.distance)
    agents[data.robot_id].distance = data.distance
    
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("distance_polling", Distance, callback)
    # rospy.spin()

if __name__ == '__main__':
    print("I was here")
    listener()
    print("I went here")
    fig, ax = plt.subplots(subplot_kw={'projection': 'polar'})
    animation = FuncAnimation(fig, AnimationPlot.animate, frames=100, fargs=(agents,))
    plt.show()
    
    
