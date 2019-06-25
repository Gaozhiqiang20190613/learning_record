#include "ros/ros.h"
#include "ros_tutorials_topic/MsgTutorial.h"
#include "ros_tutorials_topic/MsgTutorial2.h"
#include <visualization_msgs/Marker.h>
#include <cmath>
#include <fstream>
#include <iostream>
#include <stdlib.h>
using namespace std;


class SubscribeAndPublish
{
public:
      SubscribeAndPublish()
    {
      sub = n.subscribe("ros_tutorial_msg", 100, &SubscribeAndPublish::msgCallback, this);
      pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 100);
    }

  void msgCallback(const ros_tutorials_topic::MsgTutorial::ConstPtr& msg)
  {
    visualization_msgs::Marker points, line_strip, line_list;
    //将收到的消息打印出来
    /*ROS_INFO("recieve msg = %d", msg->stamp.sec);
    ROS_INFO("recieve msg = %d", msg->stamp.nsec);
    ROS_INFO("recieve msg = %d", msg->data);*/

    //ROS_INFO("publish group%d point%d:(%d, %d, %d)", msg->len, msg->num, msg->data);
    std::vector<int> array = msg->data;
    ros::Rate r(1);
    //point_pose dot[msg->len];

    //ros_tutorials_topic::MsgTutorial2 pointlist;
    points.header.frame_id = line_strip.header.frame_id = line_list.header.frame_id = "/my_frame";
    points.header.stamp = line_strip.header.stamp = line_list.header.stamp = ros::Time::now();
    points.ns = line_strip.ns = line_list.ns = "points_and_lines";
    points.action = line_strip.action = line_list.action = visualization_msgs::Marker::ADD;
    points.pose.orientation.w = line_strip.pose.orientation.w = line_list.pose.orientation.w = 1.0;

    points.id = 0;
    line_strip.id = 1;
    line_list.id = 2;
    // %EndTag(ID)%

    // %Tag(TYPE)%
    points.type = visualization_msgs::Marker::POINTS;
    line_strip.type = visualization_msgs::Marker::LINE_STRIP;
    line_list.type = visualization_msgs::Marker::LINE_LIST;
    // %EndTag(TYPE)%

    // %Tag(SCALE)%
    // POINTS markers use x and y scale for width/height respectively
    points.scale.x = 0.2;
    points.scale.y = 0.2;

    // LINE_STRIP/LINE_LIST markers use only the x component of scale, for the line width
    //    line_strip.scale.x = 0.1;
    //    line_list.scale.x = 0.1;
    // %EndTag(SCALE)%

    // %Tag(COLOR)%
    // Points are green
    points.color.g = 1.0f;
    points.color.a = 1.0;

    /*for (int j = 0; j < msg->len; j++)
    {
      dot[j].x = msg->data[j*3];
      dot[j].y = msg->data[j*3+1];
      dot[j].z = msg->data[j*3+2];
    }*/

    for (int j = 0; j < msg->len; ++j)
      {
        geometry_msgs::Point p;
        p.x = msg->data[j*3];
        p.y = msg->data[j*3+1];
        p.z = msg->data[j*3+2];
        points.points.push_back(p);
      }
    pub.publish(points);
    r.sleep();
  }

private:
  ros::NodeHandle n;
  ros::Publisher pub;
  ros::Subscriber sub;

  struct point_pose{
    int len;
    int num;
    int x;
    int y;
    int z;
  };
};

int main(int argc, char **argv)
{
  //初始化发布者节点
  ros::init(argc, argv, "topic_subscriber_publisher");
  //初始化发布者节点句柄

  SubscribeAndPublish SAPObject;

  ros::spin();

  return 0;
}
