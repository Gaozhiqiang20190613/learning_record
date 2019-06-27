#include <sstream>
#include "ros/ros.h"
#include "std_msgs/String.h"

int main(int argc, char **argv)
{
  //初始化发布者节点
  ros::init(argc, argv, "talker");
  //初始化发布者节点句柄
  ros::NodeHandle nh;
  //向Master注册节点信息
  ros::Publisher chatter_pub = nh.advertise<std_msgs::String>("chatter", 1000);
  //设置循环频率
  ros::Rate loop_rate(10);

  int count = 0;

  while (ros::ok())
  {
    std_msgs::String msg;
    std:: stringstream ss;
    ss << "hello world " << count;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());

    chatter_pub.publish(msg);
    //等待循环调回函数
    ros::spinOnce();
    //按照循环频率延时
    loop_rate.sleep();
    ++count;
  }

  return 0;
}
