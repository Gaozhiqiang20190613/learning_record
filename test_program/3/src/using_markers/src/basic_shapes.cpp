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
