/*#######################################
## Relation Files:
##   points_and_lines.cpp(this file)
##   createdata.cpp
##   databag.dat data
##
## Features:
##   Mark some points in rviz
##
## Struce:
##   Compiling createdata to get data and
## executing, to write some points in databag.dat,
## then points_and_lines.cpp executed to get some
## points by reading databag.dat to send points to
## rviz.
##
## Run(Under ROS workspaces execute commend lines blow):
##   catkin_make
##   source devel/setup.bash
##   rosrun using_makers points_and_lines
##   rviz
##   then add a marker in rviz and change map to
## /my_frame(Global Options-> Fixed Frame)
########################################*/

/*******************************/
/*#############Test############*/
/*******************************/

#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <cmath>
#include <fstream>
#include <iostream>
#include <stdlib.h>
using namespace std;

struct point_pose{
  int num;
  float x;
  float y;
  float z;
};

int main( int argc, char** argv )
{
  ros::init(argc, argv, "points_and_lines");  // define the name is points_and_lines nodes
  ros::NodeHandle n;    //define node's handle
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 10);  //registered the node to master

  ros::Rate r(1);

  point_pose dot[9];
  int i;
  while (ros::ok())
  {
// %Tag(MARKER_INIT)%
    visualization_msgs::Marker points;
    points.header.frame_id = "/my_frame";
    points.header.stamp = ros::Time::now();
    points.ns = "points_and_lines";
    points.action = visualization_msgs::Marker::ADD;
    points.pose.orientation.w = 1.0;
// %EndTag(MARKER_INIT)%

// %Tag(ID)%
    points.id = 0;
// %EndTag(ID)%

// %Tag(TYPE)%
    points.type = visualization_msgs::Marker::POINTS;
// %EndTag(TYPE)%

// %Tag(SCALE)%
    // POINTS markers use x and y scale for width/height respectively
    points.scale.x = 0.2;
    points.scale.y = 0.2;
// %EndTag(SCALE)%

// %Tag(COLOR)%
    // Points are green
    points.color.g = 1.0f;
    points.color.a = 1.0;
// %EndTag(COLOR)%

// %Tag(HELIX)%
    // Create the vertices for the points and lines
    for(i = 0; i < 9; i++)
    {
      infile.read((char *)&dot[i], sizeof(dot[i]));
    }
    infile.close();

    for (uint32_t i = 0; i < 9; ++i)
    {
      geometry_msgs::Point p;

      p.x = dot[i].x;
      p.y = dot[i].y;
      p.z = dot[i].z;
      points.points.push_back(p);
    }
// %EndTag(HELIX)%
    marker_pub.publish(points);
    r.sleep();
  }
}
// %EndTag(FULLTEXT)%
/*##############################
## Result: Some points is marked in rviz
###############################*/


/*******************************/
/*############Summary##########*/
/*******************************/

/*##############################
##   This struct couldn't show the
## relations of sensor node, process
## node and rviz, so please create a
## point who not only subscriber but
## also publisher to transport points
## to rviz.
###############################*/
