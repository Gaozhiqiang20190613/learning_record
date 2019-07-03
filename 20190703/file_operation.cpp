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
    i = Random(1,100);
    object detect_now[i];

    //向存储结构中存入数据
    for(int j = 0; j < i; j++)
    {
      //detect_now.timer = ;
      for(int k = 0; k < 6; k=k+2)
      {
        detect_now[j].detect[k] = Random(1,100);
        detect_now[j].detect[k+1] = Random(detect_now[j].detect[k]+1,detect_now[j].detect[k]+5);
      }
    }

    for(int j = 0; j < i; j++)
    {
      outfile << " " << detect_now[j].detect[0] << " " << detect_now[j].detect[1] << " " << detect_now[j].detect[2] << " " << detect_now[j].detect[3] << " " << detect_now[j].detect[4] << " " << detect_now[j].detect[5] << '\n';
    }
    //关闭文件
    outfile.close();
  }

  void read_cal()
  {
    int x, y, z;
    if(n >= 100)
    {
      n = 0;
    }
    x = n;
    y = n;
    z = 0;
    ifstream infile("detectfile.txt", ios::in);
    if(!infile)
    {
      cerr << "open error2!" << endl;
      abort();
    }
    object_pose pose[i];
    object print_now[i];
    for(int j = 0; j < i; j++)
    {
      //infile.read((char *)&print_now[j], sizeof(print_now[j]));
      infile >> print_now[j].detect[0] >> print_now[j].detect[1] >> print_now[j].detect[2] >> print_now[j].detect[3] >> print_now[j].detect[4] >> print_now[j].detect[5];
      //cout << " " << print_now[j].detect[0] << " " << print_now[j].detect[1] << " " << print_now[j].detect[2] << " " << print_now[j].detect[3] << " " << print_now[j].detect[4] << " " << print_now[j].detect[5] << '\n';
      pose[j].point[0] = print_now[j].detect[0];
      pose[j].point[1] = print_now[j].detect[2];
      pose[j].point[2] = print_now[j].detect[4];
      pose[j].volume[0] = abs(print_now[j].detect[1] - print_now[j].detect[0]);
      pose[j].volume[1] = abs(print_now[j].detect[3] - print_now[j].detect[2]);
      pose[j].volume[2] = abs(print_now[j].detect[5] - print_now[j].detect[4]);
      //cout << "Point "<< j+1 << "(" << pose[j].point[0] << ", " << pose[j].point[1] << ", " << pose[j].point[2] << ")" << "  " << "Volume:"<< pose[j].volume[0] << "*" << pose[j].volume[1] << "*" << pose[j].volume[2] << '\n';
      a = abs(x - pose[j].point[0]);
      b = abs(y - pose[j].point[1]);
      c = abs(z - pose[j].point[2]);
      l = a*a+b*b+c*c;
      if(j == 0)
      {
        minl = l;
      }
      else
      {
        if(minl > l)
        {
          minl = l;
          m = j;
        }
      }
    }

    ofstream outfile("detectfile2.txt", ios::out);
    if(!outfile)
    {
      cerr<<"open error!"<<endl;
      exit(1);
    }


    cout << "This time have " << i << " points" << endl;
    outfile << "x = {";
    for(int j = 0; j < i; j++)
    {
      outfile << pose[j].point[0] << ", ";
    }
    outfile << "}" << '\n';
    outfile << "y = {";
    for(int j = 0; j < i; j++)
    {
      outfile << pose[j].point[1] << ", ";
    }
    outfile << "}" << '\n';

    cout << "The target point:(" << x << ", " << y << ", " << z << ")" << endl;
    cout << "The near one:(" << pose[m].point[0] << ", " << pose[m].point[1] << ", " << pose[m].point[2] << ")" << endl;
    cout << "its volume is "<< pose[m].volume[0] << "*" << pose[m].volume[1] <<"*" << pose[m].volume[2] << " cm^3" << endl;
    cout <<"They distant is:" << sqrt(minl) << endl;
    ++n;
  }


private:
  int i;     //points number
  int l;     //distant
  int minl;  //min distant
  int m;     //mark
  int a, b, c;  //distant calculator
  int n;

  struct object{
    //time;
    int detect[6];
  };

  struct object_pose{
    //time;
    int point[3];
    int volume[3];
  };
};

int main()
{
  FileRW Obj;
  //while(1)
  //{
    Obj.create_file();
    Obj.read_cal();
  //}
  return 0;
}
