import math

import numpy as np
from numpy.linalg import svd
from sklearn.manifold import MDS


def MDS_fitting(matrix):
    mds = MDS(n_components=2, dissimilarity='precomputed', normalized_stress=False, metric=True)
    mds_coors = mds.fit_transform(matrix)

    return mds_coors


def remove_uncertain_measurement(distances, certainty, threshold=0.5):
    """
    Remove uncertain measurements from the matrix of distances.

    :param distances: Matrix of distances.
    :param certainty: Certainty of each distance.
    :param threshold: Threshold below which a measurement is considered uncertain.
    :return: Matrix of distances without uncertain measurements. (replaced with -1)
    """
    # Create a copy of the matrix of distances
    distances = distances.copy()

    # Iterate over the matrix of distances
    for i in range(distances.shape[0]):
        for j in range(i, distances.shape[1]):
            # If the certainty is below the threshold, replace the distance with -1
            if i != j and certainty[i, j] < threshold:
                distances[i, j] = -1

    return distances


def remove_uncertain_agents(distances, certainty, threshold=0.5):
    """
    Remove agents with uncertain measurements from the matrix of distances.

    :param distances: Matrix of distances.
    :param certainty: Certainty of each distance.
    :param threshold: Threshold below which a measurement is considered uncertain.
    :return: Matrix of distances without uncertain agents.
    """
    # Create a copy of the matrix of distances
    distances_without_uncertainty = remove_uncertain_measurement(distances, certainty, threshold)

    to_remove = []

    # Iterate over the matrix of distances
    for i in range(distances_without_uncertainty.shape[0]):
        # If any distances for an agent are uncertain, replace the distances with -1
        if np.any(distances_without_uncertainty[:, i] == -1):
            to_remove.append(i)

    # Remove the agents with uncertain measurements
    distances_without_uncertainty = np.delete(distances_without_uncertainty, to_remove, axis=0)
    distances_without_uncertainty = np.delete(distances_without_uncertainty, to_remove, axis=1)

    return distances_without_uncertainty, to_remove


def find_rotation_matrix(X, Y, flipped=False):
    """
    Find the rotation matrix between two point clouds using SVD.

    Parameters:
    - X: Numpy array representing the first point cloud (3xN matrix).
    - Y: Numpy array representing the second point cloud (3xN matrix).
    - flipped : authorize flipping Z plane to better fit the reference point

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

    # special reflection case
    if np.linalg.det(R) < 0 and flipped:
        Vt[:, 1] *= -1
        R = Vt.T @ U.T

    t = -R @ center_X + center_Y

    return R, t


def rotate_and_translate(reference, points, flipped=False):
    rotation, _ = find_rotation_matrix(reference.T, points.T, flipped=flipped)

    # Apply the rotation
    points_rotated = points @ rotation

    # First, find the centroid of the original points
    centroid = np.mean(reference, axis=0)

    # Then, find the centroid of the MDS points
    points_centroid = np.mean(points_rotated, axis=0)

    # Find the translation vector
    translation = centroid - points_centroid

    # Translate the MDS points
    return points_rotated + translation.T
