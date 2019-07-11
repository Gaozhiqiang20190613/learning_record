/*### Test Two ###*/
#include <iostream>
#include <stdlib.h>
#include <fstream>
#include <math.h>

using namespace std;
class FileRW
{
public:
  //产生随机数
  int Random(int start, int end)
  {
    int dis = end - start;
    return rand() % dis + start;
  }

  void print_info(float obj[], int length)
  {
    for(int l=0; l<length; l++){
      if(l == (length-1)){
        cout << obj[l];
      }
      else{
        cout << obj[l] << ", ";
      }
    }
    cout << ")" << endl;
  }

  //创建文件
  void create_file()
  {
    //创建文件，并检查文件创建是否成功
    ofstream outfile("detectfile.txt", ios::out);
    if(!outfile)
    {
      cerr<<"open error!"<<endl;
      exit(1);
    }

    //随机生成点的个数
    i = 1000;
    //i = Random(1,100);
    object detect_now[i];

    for(int j=0;j<200; j++)
    {
        detect_now[j].detect[0] = 20+j;
        detect_now[j].detect[1] = 20+j;
        detect_now[j].detect[2] = 230;
        detect_now[j].detect[3] = 230;
        detect_now[j].detect[4] = 0;
        detect_now[j].detect[5] = 0;

        detect_now[j+500].detect[0] = 20+j;
        detect_now[j+500].detect[1] = 20+j;
        detect_now[j+500].detect[2] = 530;
        detect_now[j+500].detect[3] = 530;
        detect_now[j+500].detect[4] = 0;
        detect_now[j+500].detect[5] = 0;
    }


    for(int j=200; j<500; j++)
    {
        detect_now[j].detect[0] = 20;
        detect_now[j].detect[1] = 20;
        detect_now[j].detect[2] = 30+j;
        detect_now[j].detect[3] = 30+j;
        detect_now[j].detect[4] = 0;
        detect_now[j].detect[5] = 0;

        detect_now[j+500].detect[0] = 20+199;
        detect_now[j+500].detect[1] = 20+199;
        detect_now[j+500].detect[2] = 30+j;
        detect_now[j+500].detect[3] = 30+j;
        detect_now[j+500].detect[4] = 0;
        detect_now[j+500].detect[5] = 0;
    }

    for(int j = 0; j < i; j++)
    {
      //将障碍物上的坐标信息写入文件
      for(int l=0; l<6; l++){
        outfile<< " " << detect_now[j].detect[l];
      }
      outfile << endl;
    }
    //关闭文件
    outfile.close();
  }

  void read_cal()
  {

    float volume[3];
    //重置目标点的坐标
    float target[3] = {0, 0, 0};
    target[0] = -18;//Random(20, 230);
    target[1] = 350;//Random(230, 530);
    target[2] = 100;

    //打开数据文件
    ifstream infile("detectfile.txt", ios::in);
    if(!infile){
      cerr << "open error2!" << endl;
      abort();
    }

    //定义存储结构
    object_pose pose[i];
    object print_now[i];
    for(int j = 0; j < i; j++){
      //获取文件中的数据//需优化
      for(int l=0; l<6; l++){
        infile >> print_now[j].detect[l];
      }

      //整理障碍物数据//已优化
      for(int l=0; l<3; l++){
        pose[j].point[l] = print_now[j].detect[l*2];
        pose[j].volume[l] = abs(print_now[j].detect[2*l+1] - print_now[j].detect[2*l]);
        //计算障碍物与目标的距离，并记录最小距离//已优化
      }
      //cout << "Point "<< j+1 << "(" << pose[j].point[0] << ", " << pose[j].point[1] << ", " << pose[j].point[2] << ")" << "  " << "Volume:"<< pose[j].volume[0] << "*" << pose[j].volume[1] << "*" << pose[j].volume[2] << '\n';
      orgl = 0;
      for(int l=0; l<3; l++){
        volume[l] = abs(target[l] - pose[j].point[l]);
        orgl = volume[l]*volume[l] + orgl;
      }

      //初始赋值
      if(j == 0)
      {
        minl = orgl;
      }
      else
      {
        if(minl > orgl)
        {
          minl = orgl;
          m = j;
        }
      }

    }

    //write python file
    ofstream outfile("detectfile.py", ios::out);
    if(!outfile){
      cerr<<"open error!"<<endl;
      exit(1);
    }

    outfile << "import matplotlib.pyplot as plt" << endl;
    outfile << "import numpy as np" << endl;

    cout << endl;

    cout << "This time have " << i << " points" << endl;
    outfile << "x = [";
    for(int j = 0; j < i; j++){
      if(j == (i-1)){
        outfile << pose[j].point[0];
      }
      else{
        outfile << pose[j].point[0] << ", ";
      }
    }
    outfile << "]" << '\n';
    outfile << "y = [";
    for(int j = 0; j < i; j++){
      if(j == (i-1)){
        outfile << pose[j].point[1];
      }
      else{
        outfile << pose[j].point[1] << ", ";
      }
      //outfile << pose[j].point[1] << ", ";
    }
    outfile << "]" << '\n';
    outfile << "m = [" << target[0] << ", " << pose[m].point[0] << "]" << endl;
    outfile << "n = [" << target[1] << ", " << pose[m].point[1] << "]" << endl;
    outfile << "plt.plot(m, n, 'b-o')" << endl;
    outfile << "plt.plot(x, y, 'r-o')" << endl;
    outfile << "plt.show()" << endl;
    outfile.close();

    //输出目标点
    cout << "The target point:(";
    print_info(target, 3);
    //输出临近点
    cout << "The near one:(" ;
    for(int l=0; l<3; l++){
      if(l == (2)){
        cout << pose[m].point[l];
      }
      else{
        cout << pose[m].point[l] << ", ";
      }
    }
    cout << ")" << endl;
    //打印物体体积
    cout << "its volume is ";//<< pose[m].volume[0] << "*" << pose[m].volume[1] <<"*" << pose[m].volume[2] << " cm^3" << endl;//需优化
    print_info(pose[m].volume, 3);
    //输出最短距离
    cout <<"They distant is:" << sqrt(minl) << endl;
    ++n;
  }

private:
  int i;     //points number
  float orgl;     //distant
  float minl;  //min distant
  int m;     //mark
  int a, b, c;  //distant calculator
  float n;
  float shapel;
  float shaped;

  struct object{
    float detect[6];
  };

  struct object_pose{
    float point[3];
    float volume[3];
  };
};

int main()
{
  FileRW Obj;
    Obj.create_file();
    Obj.read_cal();
  return 0;
}
