#! /bin/sh
# File used to launch all requirements at once for the simple distance/communication experiment

cd ros
catkin_make
source devel/setup.bash
roslaunch communication execute.launch

echo "Application Launched!"


