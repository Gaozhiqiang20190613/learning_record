#include "ros/ros.h"
#include "std_msgs/String.h"
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <sensor_msgs/PointCloud2.h>
#include <fstream>
#include <cassert>
#include <string>
#include <sstream>


int flag=0;

class forPointCloud
{
private:
  ros::NodeHandle nh;
  ros::Subscriber sub;
public:
  forPointCloud()
{
  sub=nh.subscribe<sensor_msgs::PointCloud2>("/velodyne_points_with_gps",2,&forPointCloud::chatterCallback,this);
}

  void chatterCallback(const sensor_msgs::PointCloud2ConstPtr& msg)
  {
    pcl::PointCloud<pcl::PointXYZ> theCloud;
    pcl::fromROSMsg(*msg,theCloud);
    std::ofstream outfile("/home/zechaoz/task/task2/pointcloudXYZ.txt");
    int length=theCloud.size();
    ROS_INFO("x=%f  y=%f  z=%f   %d",theCloud[0].x,theCloud[0].y,theCloud[0].z,length);
    for(int i=0;i<length;++i)
    {
       outfile<<theCloud[i].x<<","<<theCloud[i].y<<","<<theCloud[i].z<<std::endl;
       ROS_INFO("now is %d\n",i);
    }
    outfile.close();
    flag=1;
  }
};




int main(int argc, char **argv)
{
  ros::init(argc, argv, "sub_pointcloud");
  forPointCloud fpc;
  ros::Time::init();
  ros::Rate r(1);

  while(ros::ok())
  {
    ros::spinOnce();
    if(flag)
      break;
    r.sleep();
  }

  return 0;

}
