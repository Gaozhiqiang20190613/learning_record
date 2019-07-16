#!/bin/bash

echo "rebuild"
gnome-terminal -x bash -c  "catkin_make"

echo "update environment"
gnome-terminal -x bash -c  "source devel/setup.bash"

echo "play rosbag"
gnome-terminal -x bash -c  "rosbag play -r 0.1 /home/zm/test/ws_one_key_slam_executable/ws_one_key_slam/dataanalyse/all2circle.bag --clock --topics /velodyne_points_with_gps"
sleep 3

echo "translate to x,y,z"
gnome-terminal -x bash -c  "rosluanch /home/zm/catkin_ws/src/demopkg/launch/test.launch"
sleep 3

echo "show node relation"
gnome-terminal -x bash -c  "rqt_graph"
