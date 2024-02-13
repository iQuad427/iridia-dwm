#! /bin/bash
# File used to launch all requirements at once for the simple distance/communication experiment


initiator="/dev/ttyACM0"
responder="/dev/ttyACM1"

echo "Modules Initialisation..."

echo "1" >> $responder
echo "G" >> $responder
sleep 1
echo "1" >> $initiator
echo "A" >> $initiator

echo "Module Initialised, leds should be on."

echo "Launching ROS Topics and Nodes"

cd ros
catkin_make
source devel/setup.bash
roslaunch communication communication_nodes.launch

echo "Stopping the modules..."

echo "Z" >> $responder
sleep 1
echo "Z" >> $initiator

echo "Application ended!"