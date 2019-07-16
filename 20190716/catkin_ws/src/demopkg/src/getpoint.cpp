#include "ros/ros.h"
#include "std_msgs/String.h"
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

using namespace std;

class SHOWPointCould
{
private:
    ros::NodeHandle node;
    ros::Subscriber subLaserCloud;
public:
  SHOWPointCould()
  {
    // subscribe to input cloud topic
    subLaserCloud = node.subscribe<sensor_msgs::PointCloud2>("/velodyne_points_with_gps", 2, &SHOWPointCould::handleCloudMessage, this);
  }
  void process( pcl::PointCloud<pcl::PointXYZ>& laserCloudIn, const ros::Time& scanTime)
  {
    size_t cloudSize = laserCloudIn.size();
    float startOri = std::atan2(laserCloudIn[0].y, laserCloudIn[0].x);
  }

  void handleCloudMessage(const sensor_msgs::PointCloud2ConstPtr &laserCloudMsg)
  {
    fstream fout("txt_out.py", ios::out);
    if(!fout.is_open())
    {
      cerr << "file open error" << endl;
      return ;
    }
    fout << "from mpl_toolkits.mplot3d import axes3d" << endl << "import matplotlib.pyplot as plt" << endl;
    fout << "fig = plt.figure(1)" << endl << "ax = fig.gca(projection='3d')" << endl;
    ROS_INFO("This group:");
    // fetch new input cloud
    pcl::PointCloud<pcl::PointXYZ> laserCloudIn;
    pcl::fromROSMsg(*laserCloudMsg, laserCloudIn);
    //size_t cloudSize = laserCloudIn.size();
    //float startOri = -std::atan2(laserCloudIn[0].y, laserCloudIn[0].x);
    //process(laserCloudIn, laserCloudMsg->header.stamp);
    for(int i=0; i<laserCloudIn.size(); i++)
    {
      ROS_INFO("now the point%d is:(%f, %f, %f)", i+1, laserCloudIn[i].x, laserCloudIn[i].y, laserCloudIn[i].z);
    }

    fout << "x = [";
    for(int i=0; i<laserCloudIn.size(); i++)
    {
       if(i == 0)
       {
         fout << laserCloudIn[i].x;
       }
       else
       {
         fout << ", " << laserCloudIn[i].x;
       }
    }
    fout << "]" << endl;
    fout << "y = [";
    for(int i=0; i<laserCloudIn.size(); i++)
    {
       if(i == 0)
       {
         fout << laserCloudIn[i].y;
       }
       else
       {
         fout << ", " << laserCloudIn[i].y;
       }
    }
    fout << "]" << endl;
    fout << "z = [";
    for(int i=0; i<laserCloudIn.size(); i++)
    {
       if(i == 0)
       {
         fout << laserCloudIn[i].z;
       }
       else
       {
         fout << ", " << laserCloudIn[i].z;
       }
    }
    fout << "]" << endl;
    fout << "figure = ax.scatter(x, y, z)" << endl << "plt.show()" << endl;
    fout.close();
  }
};

int main(int argc, char **argv)
{
  ros::init(argc, argv, "getpoint");
  SHOWPointCould SHOWPoint;
  ros::spin();
  return 0;
}
