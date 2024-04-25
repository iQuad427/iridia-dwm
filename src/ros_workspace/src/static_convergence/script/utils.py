import numpy as np
import scipy
from numpy.linalg import svd
from numpy.random import uniform, randn


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
    flip = False
    if not flipped and np.linalg.det(R) < 0:
        flip = True

    return R, flip


def rotate_and_translate(reference, points):
    rotation, flip = find_rotation_matrix(reference.T, points.T)

    # Apply the rotation
    points_rotated = points @ rotation

    # First, find the centroid of the original points
    centroid = np.mean(reference, axis=0)

    # Then, find the centroid of the MDS points
    points_centroid = np.mean(points_rotated, axis=0)

    # Find the translation vector
    translation = centroid - points_centroid

    # Translate the MDS points
    return points_rotated + translation.T, flip


def create_uniform_particles(x_range, y_range, hdg_range, n):
    particles = np.empty((n, 3))
    particles[:, 0] = uniform(x_range[0], x_range[1], size=n)
    particles[:, 1] = uniform(y_range[0], y_range[1], size=n)
    particles[:, 2] = uniform(hdg_range[0], hdg_range[1], size=n)
    particles[:, 2] %= 2 * np.pi
    return particles


def create_gaussian_particles(mean, std, n):
    particles = np.empty((n, 3))
    particles[:, 0] = mean[0] + (randn(n) * std[0])
    particles[:, 1] = mean[1] + (randn(n) * std[1])
    particles[:, 2] = mean[2] + (randn(n) * std[2])
    particles[:, 2] %= 2 * np.pi
    return particles


class ParticleFilter:
    def __init__(self, n, initial_pose=None):
        self.N = n

        if initial_pose is not None:
            self.particles = create_gaussian_particles(mean=initial_pose, std=(10, 10, np.pi / 2), n=n)
        else:
            self.particles = create_uniform_particles((-100, 100), (-100, 100), (0, 6.28), n)

        self.weights = np.ones(n) / n

    def predict(self, u, std, dt=1.):
        # Predict a given distance walked by the agent within a time dt
        dist = u[1] * dt + (randn(self.N) * std[1])

        # Choose a direction randomly (if the agent is moving, angle is not changing)
        angle = u[0] + (randn(self.N) * std[0])

        self.particles[:, 0] += np.cos(angle) * dist
        self.particles[:, 1] += np.sin(angle) * dist
        self.particles[:, 2] += angle

    def update(self, z, R, agents_pose_est):
        for i, agent_pose_est in enumerate(agents_pose_est):
            if z[i] > 0:
                distance = np.linalg.norm(self.particles[:, 0:2] - agent_pose_est[0:2], axis=1)
                self.weights *= scipy.stats.norm(distance, R).pdf(z[i])

        self.weights += 1.e-300
        self.weights /= sum(self.weights)

    def neff(self):
        return 1. / np.sum(np.square(self.weights))

    def resample(self):
        indexes = np.random.choice(range(self.N), size=self.N, p=self.weights)
        self.particles[:] = self.particles[indexes]
        self.weights[:] = self.weights[indexes]
        self.weights /= np.sum(self.weights)

    def estimate(self):
        return np.average(self.particles, weights=self.weights, axis=0)

    def get_particles(self):
        return self.particles

    def get_weights(self):
        return self.weights


class MultiAgentParticleFilter:
    def __init__(self, a, n, initial_poses=None):
        self.N = n
        if initial_poses is None:
            self.filters = [ParticleFilter(n) for _ in range(a)]
        else:
            self.filters = [ParticleFilter(n, initial_pose) for initial_pose in initial_poses]

    def predict(self, u, std, dt=1.):
        for f in self.filters:
            f.predict(u, std, dt)

    def update(self, z, R, agents_pose_est):
        for f, m in zip(self.filters, z):
            f.update(m, R, agents_pose_est)

    def neff(self):
        return np.mean([f.neff() for f in self.filters])

    def resample(self):
        for f in self.filters:
            f.resample()

    def estimate(self):
        return np.array([f.estimate() for f in self.filters])

    def get_particles(self):
        return [f.get_particles() for f in self.filters]

    def get_weights(self):
        return [f.get_weights() for f in self.filters]

