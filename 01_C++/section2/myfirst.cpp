//myfirst.cpp -- displays a message
#include <iostream>      //处理器目录
//[函数返回类型] [函数名]（[形参列表]）
int main(void)           //函数开头
{                        //函数体开始
  using namespace std;   //定义一个可视化空间
  cout << "Come up and C++ me some time.";   //发送消息
  cout << endl;          //开始新行
  cout << "You won't regret it!" << endl;   //再次发送消息
  return 0;              //命令终结 return [返回值]
}                        //函数体结尾

/*#################################
1.endl为换行的意思，表示该行结束
2.C++程序必须包含一个名为main()的函数，并
从该函数进行执行，没有则程序不完整，编译器将
指出报错;
3.注释
  “//”   单行注释
  “/*内容 * /    多行注释
#################################*/
