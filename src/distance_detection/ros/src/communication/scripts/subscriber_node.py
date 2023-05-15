#!/usr/bin/env python3
import rospy
import random
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from communication.msg import Distance
from dwm1001 import DWM1001

DIST = 0
COL = 1

COLORS = {
    'R' : "red",
    'B' : "blue",
    'G' : "green",
    'Y' : "yellow",
    'b' : "black",
    'g' : "grey"
}


class AnimationPlot:

    def animate(self, robots):
        ax.clear()
        ax.set_rmax(5)
        ax.set_rlabel_position(0)
        ax.grid(color ='grey', linestyle='-', linewidth=0.1)

        for robot in robots:
            plot = plt.Circle(
                (0, 0), robots[robot][DIST],
                transform=ax.transData._b,
                color=COLORS[robots[robot][COL]],
                fill=False
            )
            ax.add_artist(plot)

        plt.pause(0.1)


agents = {}

def callback(data):
    rospy.loginfo("Robot : %d, Color : %s, Distance : %f", data.robot_id, data.color, data.distance)
    agents[data.robot_id] = (data.distance, data.color)

    closest_agent_color = "N"
    best_distance = 100
    for agent in agents:
        agent_info = agents[agent][DIST]
        if distance := agent_info[DIST] < best_distance:
            best_distance = distance
            closest_agent_color = agent_info[COL]

    responder = DWM1001('/dev/ttyACM1')
    responder.write(closest_agent_color)

    
def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("distance_polling", Distance, callback)
    # rospy.spin()

if __name__ == '__main__':
    listener()
    fig, ax = plt.subplots(subplot_kw={'projection': 'polar'})
    animation = FuncAnimation(fig, AnimationPlot.animate, frames=100, fargs=(agents,))
    plt.show()
    
    
