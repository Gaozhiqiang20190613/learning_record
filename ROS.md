常用ROS工具使用
rosrun rqt_graph rqt_graph  //查看节点关系图
rosrun rqt_plot rqt_plot  //查看话题中传输的消息数据
rosrun rqt_console rqt_console
rosrun rqt_logger_level rqt_logger_level

# 1 msg文件与srv文件
## 1.1 msg文件
&#8195;&#8195;msg文件是ROS中的简单的文本文件，用以记录消息的类型
```
<msg_name>.msg   //msg文件标记
```
### 1.1.1 msg文件类型
```
int8, int16, int32, int64 (plus uint*)
float32, float64
string
time, duration
other msg files
variable-length array[] and fixed-length array[C]
```
&#8195;&#8195;其中other msg file文件的使用方式为：
```
<msg_name>/<msg_member_name> <member_name>
```
### 1.1.2 msg文件的编写规则
&#8195;&#8195;msg文件的编写较为简单，由消息类型与消息成员的形式以列表的方式进行编写
```
//示范
<msg_type1> <msg_member1>
<msg_type2> <msg_member2>   

//示例
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist
```
### 1.1.3 msg文件的相关操作
&#8195;&#8195;msg文件存放在包下的src/msg目录下。
```
echo "<msg_type> <member_name>" >
```
|检索|作用|一般|
|:-:|:-:|:-:|
|搜寻find_package(catkin|添加包的依赖库（包括信息依赖与其他依赖|roscpp</br>rospy</br>std_msgs</br>generate_messages|
|catkin_package|添加信息依赖|message_runtime|
|add_message_files|添加信息文件|\|
|generate_messages|生成工程中的|std_msgs|

##  1.2 srv文件
&#8195;&#8195;srv的消息类型同msg文件的消息类型相同，不同的地方在于src文件的内容格式划分为两个部分，这两个部分使用“---”进行隔开
### 1.1.1 srv文件的编写规则
```
<srv_type1> <request_member1>
<srv_type2> <request_member2>
---
<srv_type3> <response_member1>
<srv_type4> <response_membersrv
```
### 1.1.2 srv文件的相关操作
&#8195;&#8195;srv文件存放在包下的src/srv目录下。
