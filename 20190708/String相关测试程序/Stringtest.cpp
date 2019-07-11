#include <cstddef>
#include <iosfwd>
#include <istream>  //?
#include <string.h>  //strlen、strcpy、strcat other?
#include <iostream>

using std::istream;
using std::ostream;

class String {
  private:
    /* data */
    char *data;    //字符串
    size_t length; //长度   size_t包含在cstddef头文件中

  public:
    String(const char *str = NULL); //默认构造函数    nullptr空指针
    String(const String &str);         //拷贝构造函数

    friend class String;   //?
    friend istream &operator>>(istream &is, String &str);
    friend ostream &operator<<(ostream &os, String &str);

    String operator+(const String &str) const; //重载+   ?为什么后面加cosnt？？ 传地址
    String &operator=(const String &str);      //重载=    传数据
    String &operator+=(const String &str);     //重载+=    传数据
    bool operator==(const String &str) const;  //重载==   ?为什么后面加cosnt？？ 传地址
    char &operator[](int n) const;             //重载[]   ?为什么后面加cosnt？？ 传数据

    size_t size() const;       //获取长度
    const char *c_str() const; //获取C字符串

    ~String();
};

String::String(const char *str) { //通用构造函数
  //判断传递的字符串是否为空，为空则直接存储结尾标志符
    if (!str) {
        length = 0;
        data = new char[1];
        *data = '\0';
    } else {
        length = strlen(str);
        data = new char[length + 1];
        strcpy(data, str);
    }
}
String::String(const String &str) { //拷贝构造函数
  //生成this？？？？？？？？
    length = str.size();
    data = new char[length + 1];
    strcpy(data, str.c_str());
}

String::~String() {
    delete[] data;
    length = 0;
}

String String::operator+(const String &str) const //重载+
{
    String newString;
    newString.length = length + str.size();
    newString.data = new char[newString.length + 1];
    strcpy(newString.data, data);
    strcat(newString.data, str.data);
    return newString;
}

String &String::operator=(const String &str) //重载+
{
    if (this == &str) {
        return *this;
    }
    delete[] data;
    length = str.size();
    data = new char[length];
    strcpy(data, str.c_str());
    return *this;
}

String &String::operator+=(const String &str) //重载+=
{
    length += str.size();
    char *newData = new char[length + 1];
    strcpy(newData, data);
    strcat(newData, str.c_str());
    delete[] data;
    data = newData;
    return *this;
}

inline bool String::operator==(const String &str) const //重载==
{
    if (length != str.size())
        return false;
    return strcmp(data, str.data) ? false : true;
}

inline char &String::operator[](int n) const //重载[]
{
    if (n >= length) {
        return data[length - 1]; //错误处理
    }
    return data[n];
}

inline size_t String::size() const //获取长度
{
    return length;
}
inline const char *String::c_str() const //获取C字符串
{
    return data;
}

istream &operator>>(istream &is, String &str) //输入
{
    char tem[1000]; //简单的申请一块内存
    is >> tem;
    str.length = strlen(tem);
    str.data = new char[str.length + 1];
    strcpy(str.data, tem);
    return is;
}

ostream &operator<<(ostream &os, String &str) //输出
{
    os << str.data;
    return os;
}

int main()
{
  String a("jahsgbdfa");
  String b("sgbdfa");
  String c;
  b += a;
  std::cout << b.c_str() << std::endl;
  return 0;
}

/*
+与+=的构造区别：
+为三个量之间的关系,运算后的值复制给新量，而+=为两个量之间的关系，运算后的量覆盖前面的量;
*/
