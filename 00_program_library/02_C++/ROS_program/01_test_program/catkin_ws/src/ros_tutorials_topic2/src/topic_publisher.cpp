#include "ros/ros.h"
#include "ros_tutorials_topic/MsgTutorial.h"
#include <fstream>
#include <iostream>
#include <stdlib.h>
#include <cmath>
using namespace std;

struct point
{
  int len;
  int num;
  int x;
  int y;
  int z;
};

int Random(int start, int end)
{
  int dis = end - start;
  return rand() % dis + start;
}

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

  int i = 0;
  int j = 0;

  ofstream outfile("databag.dat", ios::binary);
  if(!outfile)
  {
    cerr << "write error!" << endl;
    abort();
  }

  while (ros::ok())
  {
    i = Random(0,10);
    point dot[i];

    int array[i*3];

    for(j = 0; j < i*3; j++)
    {
      array[j] = 0;
    }

    for(j = 0; j < i*3; j++)
    {
      array[j] = Random(0,5);
      //ROS_INFO("\npublish test1 point%d:(%d, %d, %d)", dot[j].num, dot[j].x, dot[j].y, dot[j].z);
    }
    std::vector<int> array1(array,array+i*3);
    msg.data = array1;
    msg.len = i*3;
    msg.num = i;

 	 // 显示 stamp . sec 消息

    ros_tutorial_pub.publish(msg);
    //等待循环调回函数
    //ros::spinOnce();
    //按照循环频率延时
    loop_rate.sleep();
    //++count;
  }

  return 0;
}
