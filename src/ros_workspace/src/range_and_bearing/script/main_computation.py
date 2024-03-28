#!/usr/bin/python3

import pickle
import sys

import numpy as np
import rospy
import matplotlib.pyplot as plt

from range_and_bearing.msg import RangeAndBearing
from trilateration.msg import Distances, Distance

from utils import find_rotation_matrix
from sensor import find_direction_vector_from_position_history, range_and_bearing

from sklearn.manifold import MDS
import matplotlib
import matplotlib.backends.backend_agg as agg
import pylab
import pygame
from pygame.locals import *


np.set_printoptions(linewidth=np.inf)
matplotlib.use("Agg")
pygame.init()

fig = pylab.figure(figsize=[8, 8], dpi=100)
ax = fig.gca()

canvas = agg.FigureCanvasAgg(fig)
renderer = canvas.get_renderer()

pygame.display.set_caption("Relative Trilateration of Swarm")

window = pygame.display.set_mode((800, 800), DOUBLEBUF)
screen = pygame.display.get_surface()

clock = pygame.time.Clock()

iteration_rate = 1

# Distance Measurements
distance_matrix = None
certainty_matrix = None

modified = False

# Uncertainty on agents
last_update = None


def compute_positions(distances, ref_plot, beacons=None):
    if distances is not None:
        matrix = distances

        # Update the data in the plot
        # Make sure the matrix is symmetric
        matrix = (matrix + matrix.T)  # removed '/2' because triangular matrix

        # Use sklearn MDS to reduce the dimensionality of the matrix
        mds = MDS(n_components=2, dissimilarity='precomputed', normalized_stress=False, metric=True, random_state=42)
        embedding = mds.fit_transform(matrix)

        # Rotate dots to match previous plot
        if ref_plot is not None:
            if beacons is None or len(beacons) < 2:
                rotation = find_rotation_matrix(ref_plot.T, embedding.T)
            else:
                rotation = find_rotation_matrix(ref_plot[beacons].T, embedding[beacons].T)

            # Apply the rotation
            embedding = embedding @ rotation

            if beacons is None:
                # First, find the centroid of the original points
                previous_centroid = np.mean(ref_plot, axis=0)
                # Then, find the centroid of the MDS points
                current_centroid = np.mean(embedding, axis=0)
            else:
                # TODO: beacons should be the list of IDs of the beacons (therefore, need to modify code)
                previous_centroid = np.mean(ref_plot[beacons], axis=0)
                current_centroid = np.mean(embedding[beacons], axis=0)

            # Find the translation vector
            translation = previous_centroid - current_centroid

            # Translate the MDS points
            embedding = embedding + translation

        return embedding


def update_plot(agent, distances, embedding, historic, measurement_uncertainty, time_uncertainty):
    if distances is None:
        raise ValueError("Distance matrix should be defined at this point")

    if embedding is None:
        return

    # Reset the axes
    ax.clear()

    # Set the axes labels and title (customize as needed)
    ax.set_xlabel('X-axis')
    ax.set_ylabel('Y-axis')
    ax.set_title('MDS Scatter Plot')

    # Set the axes limits (customize as needed)
    ax.set_xlim(-600, 600)
    ax.set_ylim(-600, 600)

    # Put grid on the plot
    ax.grid(color='grey', linestyle='-', linewidth=0.1)

    # Update the scatter plot data
    plt.scatter(embedding[:, 0], embedding[:, 1], c='red')
    plt.scatter(embedding[agent, 0], embedding[agent, 1], c='blue')

    # Make the triangle matrix symmetric to simplify data access
    distances = distances + distances.T

    for i, point in enumerate(reversed(historic)):
        ax.add_patch(
            plt.Circle(
                point,
                time_uncertainty,
                color='r',
                fill=False,
                alpha=0.5 / (i + 1),
            )
        )

    for i, position in enumerate(embedding):
        ax.add_patch(
            plt.Circle(
                position,
                time_uncertainty,
                color='r', fill=False
            )
        )
        ax.add_patch(
            plt.Circle(
                position,
                distances[0, i],
                color='b', fill=False,
                linewidth=10 / (1 - measurement_uncertainty[i]), alpha=0.1
            )
        )

    if historic:
        # Plot the direction vector (from agent of interest)
        direction_vector = find_direction_vector_from_position_history(historic) * 10
        plt.quiver(
            *historic[-1], direction_vector[0] * 10, direction_vector[1] * 10,
            angles='xy', scale_units='xy', scale=1, color='r', label='Direction vector'
        )

        # Find the range and bearing to the other agents
        _range_and_bearing = range_and_bearing(agent, historic, np.array(embedding))

        # Compute the angle between the direction vector and the x-axis
        angle = np.arctan2(direction_vector[1], direction_vector[0])

        # Plot the range and bearing relative to the agent of interest direction
        for i, (r, b) in enumerate(_range_and_bearing):
            plt.quiver(
                *historic[-1], r * np.cos(b + angle), r * np.sin(b + angle),
                angles='xy', scale_units='xy', scale=1, color='g', alpha=0.5,
                label=f'Agent {i + 1}'
            )

    # Redraw the canvas
    canvas.draw()
    renderer = canvas.get_renderer()
    raw_data = renderer.tostring_rgb()

    # Update the display
    size = canvas.get_width_height()
    surf = pygame.image.fromstring(raw_data, size, "RGB")
    screen.blit(surf, (0, 0))
    pygame.display.flip()


def add_distance(robot_idx, data: Distance):
    """
    :param robot_idx: the robot that measured the distance
    :param data: the distance it measured, with the certainty
    :return: Nothing, only parse to add to the distance_matrix
    """
    global distance_matrix, certainty_matrix, modified

    if distance_matrix is None or last_update is None:
        raise ValueError("Distance matrix, certainty matrix and update table should be created at this point")

    other_robot_idx = data.other_robot_id - ord('B')

    x = robot_idx
    y = other_robot_idx
    if robot_idx > other_robot_idx:
        x = other_robot_idx
        y = robot_idx

    # Only update if certainty is greater than the one of the previous measurement
    if certainty_matrix[x, y] < data.certainty:
        distance_matrix[x, y] = data.distance
        certainty_matrix[x, y] = data.certainty

        modified = True


def callback(data, args):
    global last_update

    if last_update is None:
        raise ValueError("Update table should be created at this point")

    # TODO: create uncertainty system, uncertainty increase on measurements received a long time ago,
    #       but also, when updated, choose the measurement with the least uncertainty

    if isinstance(data, Distance):
        self_idx = args[0] - ord('B')
        last_update[self_idx] = 0  # TODO: not sure that it should be updated this way

        add_distance(self_idx, data)
    elif isinstance(data, Distances):
        robot_idx = data.robot_id - ord('B')  # FIXME: Should start from 'B' since 'B' is the broadcast address
        last_update[robot_idx] = 0

        for robot in data.ranges:
            add_distance(robot_idx, robot)


def create_matrix(n: int):
    global distance_matrix, certainty_matrix, last_update

    # Create distance matrix (upper triangle cells are ones)
    mask = np.triu_indices(n, k=1)
    first_matrix = np.zeros((n, n))
    second_matrix = np.zeros((n, n))

    first_matrix[mask] = 1
    distance_matrix = first_matrix

    second_matrix[mask] = 1
    certainty_matrix = second_matrix

    # Create last update
    last_update = np.zeros((n,))

    if distance_matrix is None or certainty_matrix is None:
        raise ValueError("Couldn't create distance matrix and/or certainty matrix")


def compute_measurement_uncertainty(certainty):
    matrix = certainty + certainty.T

    # Compute mean certainty for each agent distances (each row or column)
    certainty = np.mean(matrix, axis=0)

    return (100 - certainty) / 100  # (uncertainty factor)


def compute_time_uncertainty(time, speed, error):
    return time * speed + error


def listener():
    global distance_matrix, certainty_matrix, modified, last_update, iteration_rate

    # Parse arguments
    ros_launch_param = sys.argv[1]

    # Parse arguments
    self_id = ord(ros_launch_param)
    n_robots = int(sys.argv[2])

    # TODO: add a parameter for the historic size

    if sys.argv[3] != "Z":
        beacons = [ord(beacon) - ord('B') for beacon in sys.argv[3].split(",")]
    else:
        beacons = None

    print(beacons)

    create_matrix(n_robots)

    if distance_matrix is None or certainty_matrix is None:
        raise ValueError("Distance matrix should exist at this point, ensure that you called create_matrix() beforehand")

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber(f'/distances', Distances, callback, (self_id,))
    rospy.Subscriber(f'/distance', Distance, callback, (self_id,))
    pub = rospy.Publisher(f'/range_and_bearing', RangeAndBearing, queue_size=10)

    data = []
    historic = []

    # Save previous values
    previous_estimation = None  # Positions used to rotate the plot (avoid flickering when rendering in real time)
    previous_estimation = compute_positions(
        distance_matrix,
        previous_estimation,
        beacons=beacons
    )  # Current estimation of the positions
    position_estimation = np.copy(previous_estimation)

    with open("output/output.txt", "wb") as f:
        crashed = False
        while not crashed:
            for event in pygame.event.get():
                if event.type == pygame.QUIT or rospy.is_shutdown():
                    crashed = True

            # Direction estimation
            measurement_uncertainty = compute_measurement_uncertainty(certainty_matrix)
            time_uncertainty = compute_time_uncertainty(iteration_rate, 15, 10)

            update_plot(self_id - ord('B'), distance_matrix, previous_estimation, historic, measurement_uncertainty, time_uncertainty)

            if modified:  # Only render and send message if data has changed
                # Update the data in the plot
                position_estimation = compute_positions(distance_matrix, previous_estimation, beacons=beacons)

                historic.append(list(position_estimation[self_id - ord('B')]))
                historic = historic[-5:]

                modified = False

                # Compute direction of agent
                msg = compute_direction()
                pub.publish(msg)

            # Save the data for later stats
            if position_estimation is not None:
                data.append(position_estimation)

            previous_estimation = np.copy(position_estimation)

            # Tick for uncertainty increase
            last_update = last_update + 1
            certainty_matrix = certainty_matrix * 0.99

            # Tick the update clock
            clock.tick(3)  # Limit to 30 frames per second

        pickle.dump(data, f)


def compute_direction():
    msg = RangeAndBearing()
    return msg


if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
