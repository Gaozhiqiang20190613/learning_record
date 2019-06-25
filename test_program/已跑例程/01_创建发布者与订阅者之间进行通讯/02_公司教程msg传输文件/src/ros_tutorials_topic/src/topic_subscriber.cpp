#include "ros/ros.h"
#include "ros_tutorials_topic/MsgTutorial.h"
//收到消息订阅消息后，进入消息回调函数
void msgCallback(const ros_tutorials_topic::MsgTutorial::ConstPtr& msg)
{
  //将收到的消息打印出来
  ROS_INFO("recieve msg = %d", msg->stamp.sec); 
  ROS_INFO("recieve msg = %d", msg->stamp.nsec);
  ROS_INFO("recieve msg = %d", msg->data);
}

int main(int argc, char **argv)
{
  //初始化订阅者节点
  ros::init(argc, argv, "topic_subscriber");
  //创建订阅者节点句柄
  ros::NodeHandle nh;

  ros::Subscriber ros_tutorial_sub = nh.subscribe("ros_tutorial_msg", 100, msgCallback);

  ros::spin();

  return 0;
}
