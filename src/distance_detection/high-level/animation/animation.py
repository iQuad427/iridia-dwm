import random

import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from models.robot import Robot

class AnimationPlot:

    def animate(self, robots: list[Robot]):
        ax.clear()
        ax.set_rmax(5)
        ax.set_rlabel_position(0)
        ax.grid(color ='grey', linestyle='-', linewidth=0.1)

        for robot in robots:
            if robot.distance != -1:
                plot = plt.Circle((0, 0), robot.distance, transform=ax.transData._b, color=robot.color, fill=False)
                ax.add_artist(plot)

        plt.pause(0.1)
        randomize_distances(robots)

def randomize_distances(robots: list[Robot]):
    for robot in robots:
        robot.distance += random.Random().randint(-1, 1) / 10


agents = [
    Robot(identifier=0, distance=1, color="red"),
    Robot(identifier=1, distance=2, color="blue"),
    Robot(identifier=2, distance=3, color="green"),
    Robot(identifier=3, distance=4, color="yellow"),
]

if __name__ == '__main__':
    fig, ax = plt.subplots(subplot_kw={'projection': 'polar'})
    animation = FuncAnimation(fig, AnimationPlot.animate, frames=100, fargs=(agents,))
    plt.show()

