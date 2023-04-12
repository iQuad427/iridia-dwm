#! /bin/bash
# File used to launch all requirements at once for the simple distance/communication experiment

cd ros
catkin_make
source devel/setup.bash
roslaunch communication communication_nodes.launch

echo "Application Launched!"


