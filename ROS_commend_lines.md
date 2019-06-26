node
```
rosnode list 查看当前运行节点
rosnode info <node_name>查看节点信息
rosnode ping <node_name>测试节点
rosrun [package_name] [node_name] 运行节点
```
rosrun rqt_graph rqt_graph  查看节点运行关系
topic
```
rostopic -h 查看rostopic的帮助
    rostopic bw     display bandwidth used by topic
    rostopic echo   print messages to screen
    rostopic hz     display publishing rate of topic
        rostopic hz [topic]    
    rostopic list   print information about active topics
    rostopic pub    publish data to topic
        rostopic pub [topic] [msg_type] [args]
        rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist -- '[2.0, 0.0, 0.0]' '[0.0, 0.0, 1.8]'
    rostopic type   print topic type
        rostopic type <topic_name>  输出话题<topic_name>的消息类型
```

rosrun rqt_plot rqt_plot  查看消息中的xy关系

service
```
rosservice -h
    rosservice list         print information about active services
    rosservice call         call the service with the provided args
        rosservice call [service] [args]
        rosservice call /spawn 2 2 0.2 ""
    rosservice type         print service type
        rosservice type [service]
    rosservice find         find services by service type
    rosservice uri          print service ROSRPC uri
```

param
```
rosparam set            set parameter
rosparam get            get parameter
    rosparam set [param_name] value
    rosparam get [param_name]
rosparam load           load parameters from file
rosparam dump           dump(卸装) parameters to file
    rosparam dump [file_name] [namespace]
    rosparam load [file_name] [namespace]
rosparam delete         delete parameter
rosparam list           list parameter names
```
