/*##  String相关函数测试  ##*/
/*#########################
## 测试一：对字符串数组进行存储与输出
## 方式：使用数组进行存储、数据流信息流进行输出打印
##########################*/
/*#include <iostream>

using namespace std;

int main ()
{
  //向数组中传递存储的字符
   char greeting[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
   //打印字符数组的信息
   cout << "Greeting message: ";
   cout << greeting << endl;

   return 0;
}*/
/*------------------------
运行结果：
    Greeting message: Hello
-------------------------*/

/*########################
## 测试二：复制字符串与拼接字符串
## 方式：使用C语言中字符串操作函数进行操作
#########################*/
/*#include <iostream>
#include <cstring>

using namespace std;

int main()
{
   char str1[11] = "Hello";
   char str2[11] = "World";
   char str3[11];
   int  len ;

   // 复制 str1 到 str3
   strcpy( str3, str1);
   cout << "strcpy( str3, str1) : " << str3 << endl;

   // 连接 str1 和 str2
   strcat( str1, str2);
   cout << "strcat( str1, str2): " << str1 << endl;

   // 连接后，str1 的总长度
   len = strlen(str1);
   cout << "strlen(str1) : " << len << endl;

   return 0;
}*/
/*--------------------------
运行结果：
    strcpy( str3, str1) : Hello
    strcat( str1, str2): HelloWorld
    strlen(str1) : 10
--------------------------*/

/*##########################
## 测试三：对字符串进行复制和拼接操作，读取字符串长度
## 方式：使用string进行操作
##########################*/
#include <iostream>
#include <string>

int main()
{
  std::string str1 = "Hello";
  std::string str2 = "World";
  std::string str3;
  int len;

  //字符串复制操作，将str1复制到str3
  str3 = str1;
  std::cout << "str3:" << str3 << std::endl;

  //拼接字符串
  str3 = str1 + str2;
  std::cout << "str1 + str2:" << str3 << std::endl;

  //读取字符串长度
  len = str3.size();
  std::cout << "str3.size():" << len << std::endl;

  return 0;
}
/*--------------------------
运行结果：
    str3:Hello
    str1 + str2:HelloWorld
    str3.size():10
--------------------------*/

/*#########################
参考链接：
    https://www.runoob.com/cplusplus/cpp-strings.html
#########################*/
