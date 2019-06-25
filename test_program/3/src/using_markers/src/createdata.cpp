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
