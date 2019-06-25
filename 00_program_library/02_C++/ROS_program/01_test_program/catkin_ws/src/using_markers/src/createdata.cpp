/*#######################################
## Relation Files:
##   points_and_lines.cpp
##   createdata.cpp(this file)
##   databag.dat data
##
## Features:
##   Mark some points in rviz
##
## Struce:
##   Compiling createdata to get data and
## executing, to write some points in databag.dat,
## then points_and_lines.cpp executed to get some
## points by reading databag.dat to send points to
## rviz.
##
## Run(Under ROS workspaces execute commend lines blow):
##   catkin_make
##   source devel/setup.bash
##   rosrun using_makers points_and_lines
##   rviz
##   then add a marker in rviz and change map to
## /my_frame(Global Options-> Fixed Frame)
########################################*/

#include <fstream>
#include <iostream>
#include <stdlib.h>
using namespace std;

struct point
{
  int num;
  float x;
  float y;
  float z;
};

int main(void)
{
  point dot[9] = {
    1, 2, 1, 0,
    2, 3, 5, 5,
    3, 2, 6, 3,
    4, 6, 3, 2,
    5, 9, 8, 0,
    6, 4, 1, 5,
    7, 5, 4, 7,
    8, 7, 2, 0,
    9, 1, 8, 0
};
  ofstream outfile("databag.dat", ios::binary);
  if(!outfile)
  {
    cerr << "open error!" << endl;
    abort();
  }
  for(int i = 0; i < 9; i++)
  {
    outfile.write((char *)&dot[i], sizeof(dot[i]));
  }
  outfile.close();
  return 0;
}
