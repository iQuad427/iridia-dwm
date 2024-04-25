import matplotlib.pyplot as plt
import numpy as np

from utils import rotate_and_translate

if __name__ == '__main__':
    points = np.array([
        [0, 0],
        [200, 0],
        [0, 200],
        [200, 200]
    ])

    new_points = np.array([
        [0, 0],
        [0, 200],
        [200, 0],
        [200, 200]
    ]) + np.array([100, 200])

    flipped_points, flip = rotate_and_translate(
        points, new_points
    )

    plt.scatter(points[:, 0], points[:, 1], c="b")
    for i, p in enumerate(points):
        plt.text(
            p[0], p[1], i,
            horizontalalignment='left',
            verticalalignment='top',
            color="b"
        )

    plt.scatter(new_points[:, 0], new_points[:, 1], c="r")
    for i, p in enumerate(new_points):
        plt.text(
            p[0], p[1], i,
            horizontalalignment='right',
            verticalalignment='top',
            color="r"
        )

    plt.scatter(flipped_points[:, 0], flipped_points[:, 1], c="g", label="non_flipped" if not flip else "flipped")
    for i, p in enumerate(flipped_points):
        plt.text(
            p[0], p[1], i,
            horizontalalignment='left',
            verticalalignment='bottom',
            color="g"
        )

    plt.legend()
    plt.axis("equal")
    plt.show()
