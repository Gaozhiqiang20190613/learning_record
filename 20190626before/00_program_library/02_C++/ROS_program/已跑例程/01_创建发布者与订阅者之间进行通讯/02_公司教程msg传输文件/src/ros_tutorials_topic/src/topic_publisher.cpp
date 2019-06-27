#include "ros/ros.h"
#include "ros_tutorials_topic/MsgTutorial.h"

int main(int argc, char **argv)
{
  //初始化发布者节点
  ros::init(argc, argv, "topic_publisher");
  //初始化发布者节点句柄
  ros::NodeHandle nh;
  //向Master注册节点信息
  ros::Publisher ros_tutorial_pub = nh.advertise<ros_tutorials_topic::MsgTutorial>("ros_tutorial_msg", 100);
  //设置循环频率
  ros::Rate loop_rate(10);
  ros_tutorials_topic::MsgTutorial msg;
  int count = 0;
  while (ros::ok())
  {
    msg.stamp = ros::Time::now();
    msg.data = count;

    ROS_INFO("send msg = %d", msg.stamp.sec); 	 // 显示 stamp . sec 消息
    ROS_INFO("send msg = %d", msg.stamp.nsec); 	
    ROS_INFO("send msg = %d", msg.data); // 显示 data 消息


    ros_tutorial_pub.publish(msg);
    //等待循环调回函数
    //ros::spinOnce();
    //按照循环频率延时
    loop_rate.sleep();
    ++count;
  }

  return 0;
}
