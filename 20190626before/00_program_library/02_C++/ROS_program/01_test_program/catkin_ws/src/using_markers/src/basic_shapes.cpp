/*#######################################
## Relation Files:
##   basic_shapes.cpp(this file)
##   MsgTutorial.msg(for Test Two and Test Three,
## but is no use for the whole project)
##
## Features:
##   Show a list of shapes in rviz
##
## Struce:
##   The nodes of this file and rviz, this
## node transport cube's point to rviz.
##
## Run(Under ROS workspaces execute commend lines blow):
##   catkin_make
##   source devel/setup.bash
##   rosrun using_makers basic_shapes
##   rviz
##   then add a marker in rviz and change map to
## /my_frame(Global Options-> Fixed Frame)
########################################*/


/*******************************/
/*#############Test############*/
/*******************************/

/*##########Test One###########*/
/*
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>

int main( int argc, char** argv )
{
  ros::init(argc, argv, "basic_shapes");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1); // 设置初始形状为立方体
  uint32_t shape = visualization_msgs::Marker::CUBE;
  while (ros::ok())
  {
    visualization_msgs::Marker marker;

    marker.header.frame_id = "/my_frame";
    marker.header.stamp = ros::Time::now();

    marker.ns = "basic_shapes";
    marker.id = 0;

    marker.type = shape;
    marker.action = visualization_msgs::Marker::ADD;
    marker.pose.position.x = 0;
    marker.pose.position.y = 0;
    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    marker.scale.x = 1.0;
    marker.scale.y = 1.0;
    marker.scale.z = 1.0;
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;
    marker.lifetime = ros::Duration();
    while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return 0;
      }
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }
    marker_pub.publish(marker);

    r.sleep();
  }
}
*/
/*##############################
## Result:The pose of point(0,0,0) have a CUBE(立方体)
###############################*/


/*##########Test Two##########*/
/*#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include "using_markers/MsgTutorial.h"  //   add message file

int main( int argc, char** argv )
{
  ros::init(argc, argv, "basic_shapes");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1); // 设置初始形状为立方体
  using_markers::MsgTutorial msg;
  int x = 2;
  int y = 1;
  int z = 0;

  uint32_t shape = visualization_msgs::Marker::CUBE;
  while (ros::ok())
  {
    msg.x = x;
    msg.y = y;
    msg.z = z;

    visualization_msgs::Marker marker;

    marker.header.frame_id = "/my_frame";
    marker.header.stamp = ros::Time::now();

    marker.ns = "basic_shapes";
    marker.id = 0;
    marker.id++;

    marker.type = shape;
    marker.action = visualization_msgs::Marker::ADD;
    marker.pose.position.x = msg.x;
    marker.pose.position.y = msg.y;
    marker.pose.position.z = msg.z;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    marker.scale.x = 1.0;
    marker.scale.y = 1.0;
    marker.scale.z = 1.0;
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;
    marker.lifetime = ros::Duration();
    while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return 0;
      }
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }
    marker_pub.publish(marker);

    r.sleep();

    x++;
    y++;
  }
}
*/
/*##############################
## Result: A CUBE(立方体) is moving at the pose of point(x,x,0)[x is a Integer(整数)]
###############################*/

/*##########Test Three##########*/
/*
#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include "using_markers/MsgTutorial.h"  //   add message file

int main( int argc, char** argv )
{
  ros::init(argc, argv, "basic_shapes");
  ros::NodeHandle n;
  ros::Rate r(1);
  ros::Publisher marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1); // 设置初始形状为立方体
  using_markers::MsgTutorial msg; //define msg files
  int x = 2;    //init msg value
  int y = 1;
  int z = 0;

  uint32_t shape = visualization_msgs::Marker::CUBE;    //init shapes
  while (ros::ok())
  {
    msg.x = x;
    msg.y = y;
    msg.z = z;

    visualization_msgs::Marker marker;

    marker.header.frame_id = "/my_frame";
    marker.header.stamp = ros::Time::now();

    marker.ns = "basic_shapes";
    marker.id = 0;

    marker.type = shape;
    marker.action = visualization_msgs::Marker::ADD;
    marker.pose.position.x = msg.x;
    marker.pose.position.y = msg.y;
    marker.pose.position.z = msg.z;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    marker.scale.x = 1.0;
    marker.scale.y = 1.0;
    marker.scale.z = 1.0;
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;
    marker.lifetime = ros::Duration();
    while (marker_pub.getNumSubscribers() < 1)
    {
      if (!ros::ok())
      {
        return 0;
      }
      ROS_WARN_ONCE("Please create a subscriber to the marker");
      sleep(1);
    }
    marker_pub.publish(marker);

    //the turn about shapes was deleted

    r.sleep();

if(x<0)
{
  x++;
  y++;
}
else
{
    if(x > 5)
    {
        x--;
        y--;
    }
    else
    {
        x++;
        y++;
    }
  }
}
}
*/
/*##############################
## Result: A CUBE(立方体) is moving at two points
###############################*/


/*******************************/
/*############Summary##########*/
/*******************************/

/*##############################
##   If you want to mark many
## points,this way couldn't fulfil
## requirements(满足要求), Because
## this way only mark one point
## Please refence points_and_lines.cpp
###############################*/
