#!/usr/bin/python3
import numpy as np
import rospy
import numpy
import matplotlib.pyplot as plt
from trilateration.msg import Distances, Distance

from numpy.linalg import svd

from sklearn.manifold import MDS

import matplotlib

matplotlib.use("Agg")

import matplotlib.backends.backend_agg as agg
import pylab
import pygame
from pygame.locals import *


pygame.init()

fig = pylab.figure(figsize=[6, 6], dpi=100)
ax = fig.gca()

canvas = agg.FigureCanvasAgg(fig)
renderer = canvas.get_renderer()

pygame.display.set_caption("Matplotlib with Pygame")

window = pygame.display.set_mode((600, 600), DOUBLEBUF)
screen = pygame.display.get_surface()

clock = pygame.time.Clock()

previous_plot = None
distance_matrix = np.array(
    [
        [0, 1, 1, 1],
        [0, 0, 1, 1],
        [0, 0, 0, 1],
        [0, 0, 0, 0]
    ]
)


def find_rotation_matrix(X, Y):
    """
    Find the rotation matrix between two point clouds using SVD.

    Parameters:
    - X: Numpy array representing the first point cloud (3xN matrix).
    - Y: Numpy array representing the second point cloud (3xN matrix).

    Returns:
    - R: 3x3 rotation matrix.
    """

    # Center the point clouds
    center_X = X.mean(axis=1).reshape(-1, 1)
    center_Y = Y.mean(axis=1).reshape(-1, 1)

    X_centered = X - center_X
    Y_centered = Y - center_Y

    # Compute the covariance matrix H
    H = X_centered @ Y_centered.T

    # Perform SVD on H
    U, _, Vt = svd(H)

    # Compute the rotation matrix R
    R = Vt.T @ U.T

    return R


def update_plot():
    global distance_matrix, previous_plot

    if distance_matrix is not None:
        matrix = distance_matrix

        # Update the data in the plot
        # Make sure the matrix is symmetric
        matrix = (matrix + matrix.T)  # removed '/2' because triangular matrix

        # Use sklearn MDS to reduce the dimensionality of the matrix
        mds = MDS(n_components=2, dissimilarity='precomputed', normalized_stress=False, metric=True, random_state=42)
        embedding = mds.fit_transform(matrix)

        # Rotate dots to match previous plot
        if previous_plot is not None:
            rotation = find_rotation_matrix(previous_plot.T, embedding.T)

            # Apply the rotation
            embedding = embedding @ rotation

            # First, find the centroid of the original points
            centroid = np.mean(previous_plot, axis=0)

            # Then, find the centroid of the MDS points
            embedding_centroid = np.mean(embedding, axis=0)

            # Find the translation vector
            translation = centroid - embedding_centroid

            # Translate the MDS points
            embedding = embedding + translation

        # Reset the axes
        ax.clear()

        # Set the axes labels and title (customize as needed)
        ax.set_xlabel('X-axis')
        ax.set_ylabel('Y-axis')
        ax.set_title('MDS Scatter Plot')

        # Set the axes limits (customize as needed)
        ax.set_xlim(-200, 200)
        ax.set_ylim(-200, 200)

        # Put grid on the plot
        ax.grid(color='grey', linestyle='-', linewidth=0.1)

        # Update the scatter plot data
        plt.scatter(embedding[:, 0], embedding[:, 1], c='r')
        previous_plot = embedding

        # Redraw the canvas
        canvas.draw()
        renderer = canvas.get_renderer()
        raw_data = renderer.tostring_rgb()

        # Update the display
        size = canvas.get_width_height()
        surf = pygame.image.fromstring(raw_data, size, "RGB")
        screen.blit(surf, (0, 0))
        pygame.display.flip()


def MDS_fitting(matrix):
    mds = MDS(n_components=2, dissimilarity='precomputed', normalized_stress=False, metric=True)
    mds_coors = mds.fit_transform(matrix)

    return mds_coors


def callback(data):
    global distance_matrix

    robot_idx = data.robot_id - ord('B')  # starts at B because A (all) is the broadcast address

    for robot in data.ranges:
        other_robot_idx = robot.other_robot_id
        distance = robot.distance

        x = robot_idx
        y = other_robot_idx
        if robot_idx > other_robot_idx:
            x = other_robot_idx
            y = robot_idx

        distance_matrix[x, y] = distance


def listener():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("trilateration_compute", Distances, callback)

    crashed = False
    while not crashed:
        for event in pygame.event.get():
            if event.type == pygame.QUIT or rospy.is_shutdown():
                crashed = True

        # Update the data in the plot
        update_plot()

        clock.tick(30)  # Limit to 30 frames per second


if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass
