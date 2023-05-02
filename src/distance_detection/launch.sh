#! /bin/bash
# File used to launch all requirements at once for the simple distance/communication experiment


initiator="/dev/ttyACM0"
responder="/dev/ttyACM0"

echo "1" >> $initiator

cd ros
catkin_make
source devel/setup.bash
roslaunch communication communication_nodes.launch

echo "Application Launched!"


