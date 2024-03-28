import numpy as np


def find_direction_vector_from_position_history(position_history):
    """
    Given a position history, find the direction vector of the movement
    :param position_history: A list of positions
    :return: The direction vector
    """
    # Convert the list to a numpy array
    position_history = np.array(position_history)

    # Compute the difference between each position
    diff = position_history[1:] - position_history[:-1]

    # Compute the direction vector by taking the mean of the differences
    direction_vector = np.mean(diff, axis=0)

    # Normalize the direction vector
    direction_vector = direction_vector / np.linalg.norm(direction_vector)

    return direction_vector


def range_and_bearing(agent, historic, plot):
    """
    Estimate the relative direction of all agents

    :param agent: id of the robot currently estimating its range and bearing to other robots of the swarm
    :param historic: sample of last known position of the robot on the plot
    :param plot: position estimation to take into consideration when computing angles
    :return: the estimated readings of the simulated range and bearing sensor
    """
    # Convert the plot to a numpy array
    plot = np.array(plot)
    historic = np.array(historic)

    # Rotate the plot to have the agent of interest at the origin and the direction vector aligned with the x-axis
    # Compute the direction vector of the movement
    direction_vector = find_direction_vector_from_position_history(historic)

    # Compute the angle between the direction vector and the x-axis
    angle = np.arctan2(direction_vector[1], direction_vector[0])

    # Compute the rotation matrix
    rotation_matrix = np.array([
        [np.cos(angle), -np.sin(angle)],
        [np.sin(angle), np.cos(angle)]
    ])

    # Rotate the plot
    plot = np.array(plot) - historic[-1]
    plot = plot @ rotation_matrix

    # Compute the range and bearing to the other agents
    _rab = []

    for x, position in enumerate(plot):
        if x != agent:
            # Compute the relative position of the other agent
            relative_position = position - plot[agent]

            # Compute the range and bearing
            _rab.append(
                [
                    np.linalg.norm(relative_position),
                    np.arctan2(relative_position[1], relative_position[0])
                ]
            )

    return _rab
