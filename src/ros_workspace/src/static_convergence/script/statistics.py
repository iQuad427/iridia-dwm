#!/usr/bin/python3
import dataclasses
import datetime
import signal
import sys
from typing import List

import rospy

from ros_utils.msg import Distances, Distance, Odometry, Statistics


@dataclasses.dataclass
class Position:
    id: int
    x: float
    y: float

    def __repr__(self):
        return f"{self.id},{self.x},{self.y}"


@dataclasses.dataclass
class Memory:
    positions: List[Position]
    timestamp: datetime.datetime

    def __repr__(self):
        buffer = f"{self.timestamp}&"
        for position in self.positions:
            buffer += f"{position}#"

        return buffer[:-1]


ground_truth = Memory(
    positions=[
        Position(0, 0, 0),
        Position(1, 160, 0),
        Position(2, 160, 160),
        Position(3, 0, 160),
    ],
    timestamp=datetime.datetime.now()
)

iterate = False
compute = True


# Add handler for SIGINT
def signal_handler(sig, frame):
    global compute
    compute = False


def positions_callback(positions, args):
    timestamp = datetime.datetime.fromtimestamp(positions.header.stamp.to_sec())

    storage = args[0]

    memory = []
    for position in positions.odometry_data:
        memory.append(
            Position(
                position.id if position.id < ord('A') else position.id - ord('A'),
                position.x if args[1] == "agent" else position.x * 100,
                position.y if args[1] == "agent" else position.y * 100,
            )
        )

    storage.append(Memory(memory, timestamp))

    if args[1] == "agent":
        global iterate
        iterate = True

    # Keep only the first and last one (use reference to list)
    storage = storage[-1:] + storage[:0]


def listener():
    global iterate

    output_dir = sys.argv[1]
    output_file = sys.argv[2]

    number_agents = sys.argv[3]
    estimated_positions = []

    # TODO: Generate one memory for each list
    # estimated_positions.append(
    #     Memory()
    # )

    agent_id = sys.argv[4]
    print(f'Agent ID: {agent_id}')

    rospy.init_node('statistics', anonymous=True)

    # Listen to statistics ROS topic
    rospy.Subscriber(f'{agent_id}/positions', Statistics, positions_callback, (estimated_positions, "agent"))

    # Name of file is statistics_output_dd_mm_hh_mm.txt
    with open(f"{output_dir}/{output_file}", "w+") as f:
        while compute:
            if iterate:
                estimation = estimated_positions[-1]

                start = estimated_positions[0].timestamp
                now = (estimation.timestamp - start).total_seconds()

                f.write(f"estim={now}={estimation}\n")
                f.write(f"truth={now}={ground_truth}\n")

                iterate = False


if __name__ == '__main__':
    # Set signal handler
    signal.signal(signal.SIGINT, signal_handler)

    try:
        listener()
    except rospy.ROSInterruptException:
        pass
