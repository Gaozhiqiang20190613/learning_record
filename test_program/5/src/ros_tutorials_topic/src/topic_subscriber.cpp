#include "ros/ros.h"
#include "ros_tutorials_topic/MsgTutorial2.h"
//收到消息订阅消息后，进入消息回调函数
void msgCallback(const ros_tutorials_topic::MsgTutorial2::ConstPtr& /*msg*/ pointlist)
{
  //将收到的消息打印出来
  /*ROS_INFO("x = %d", pointlist->x);
  ROS_INFO("y = %d", pointlist->y);
  ROS_INFO("z = %d", pointlist->z);*/
  ROS_INFO("publish point%d:(%d, %d, %d)", pointlist->num, pointlist->x, pointlist->y, pointlist->z);
  /*ROS_INFO("recieve msg = %d", msg->stamp.sec);
  ROS_INFO("recieve msg = %d", msg->stamp.nsec);
  ROS_INFO("recieve msg = %d", msg->data);*/
}

int main(int argc, char **argv)
{
  //初始化订阅者节点
  ros::init(argc, argv, "topic_subscriber");
  //创建订阅者节点句柄
  ros::NodeHandle nh;

  ros::Subscriber ros_tutorial_sub = nh.subscribe("ros_tutorial_pointlist", 1, msgCallback);

  ros::spin();

  return 0;
}
