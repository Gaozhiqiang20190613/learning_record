#include "ros/ros.h"
#include "std_msgs/String.h"
//收到消息订阅消息后，进入消息回调函数
void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  //将收到的消息打印出来
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}

int main(int argc, char **argv)
{
  //初始化订阅者节点
  ros::init(argc, argv, "2");
  //创建订阅者节点句柄
  ros::NodeHandle nh;

  ros::Subscriber sub = nh.subscribe("chatter", 1000, chatterCallback);

  ros::spin();

  return 0;
}
