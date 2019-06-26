```
###############################################
##        ROS的消息声明（话题、服务、动作）       ##
###############################################
## cmake版本信息及功能包名称
cmake_minimum_required(VERSION 2.8.3)
project(<package_name>)
## 添加编译器
# add_compile_options(-std=c++11)
## 添加功能包的依赖包
# find_package(catkin REQUIRED COMPONENTS
  <dependence_package_name1>
  <dependence_package_name2>
# )

## 未知
# find_package(Boost REQUIRED COMPONENTS system)

##
# catkin_python_setup()
######################################################################
## 处理对象：                                                         ##
##     <package_name>：功能包名                                       ##
##     <dependence_package_name1>：功能包的依赖包1名                   ##
##     <dependence_package_name1>：功能包的依赖包1名                   ##
######################################################################

###############################################
##        ROS的消息声明（话题、服务、动作）       ##
###############################################
## 在src/msg目录下生成消息文件
# add_message_files(
#   FILES
#   <msg_name>.msg
# )

## 在src/msg目录下生成消息文件
# add_service_files(
#   FILES
#   <srv_name>.srv
# )

## 在src/msg目录下生成消息文件
# add_action_files(
#   FILES
#   <act_name>.action
# )

## 添加消息/服务的依赖
# generate_messages(
#   DEPENDENCIES
#   <msg_dep_package>
# )

######################################################################
## 处理对象：                                                         ##
##     <msg_name>.msg：msg文件名                                      ##
##     <srv_name>.srv：srv文件名                                      ##
##     <act_name>.action：action文件名                                ##
##     <msg_dep_package>：消息相关依赖包                               ##
######################################################################

################################################
##             ROS的动态参数声明               ##
################################################
## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )

###################################
## catkin specific configuration ##
###################################
# catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES using_markers
#  CATKIN_DEPENDS roscpp visualization_msgs
#  DEPENDS system_lib
# )


################################################
##                   构建                     ##
################################################
## 添加本地头文件
##>>>>>>对功能包
# include_directories(include ${catkin_INCLUDE_DIRS})
## 声明C++库
# add_library(${PROJECT_NAME} src/${PROJECT_NAME}/using_markers.cpp)
## 对库添加依赖
# add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
##>>>>>>对节点
## 声明C++可执行程序
# add_executable(${PROJECT_NAME}_node src/using_markers_node.cpp)
## 对节点进行重命名，去掉后缀（.cpp）
# set_target_properties(${PROJECT_NAME}_node PROPERTIES OUTPUT_NAME node PREFIX "")
## 添加node的依赖
# add_dependencies(${PROJECT_NAME}_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
## 连接到库或者可执行目标上
# target_link_libraries(${PROJECT_NAME}_node ${catkin_LIBRARIES})

######################################################################
## 处理对象：                                                        ##
##     ${PROJECT_NAME}：功能包名                                     ##
##     ${PROJECT_NAME}_node：节点名                                  ##
######################################################################


###############################################
##                    安装                    ##
###############################################
##
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS ${PROJECT_NAME} ${PROJECT_NAME}_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

###############################################
##                   测试                    ##
###############################################

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_using_markers.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
```
&#8195;&#8195;因为CMakeLists.txt文件记录着从工程到节点，以及从源文件到生成文件的一系列信息，因此，在对工程的内容进行创建的过程中，为便于进行开发，这里将关键词列表，根据相关的操作操作来检索需要进行配置的位置，通过查找替换的方式进行操作:
```
功能包的相关配置
消息的相关配置
   检索:
     msg:Message1.msg
     srv:Service1.srv
     act:Action1.action
   替换:
     msg:<msg_name>.msg
     srv:<srv_name>.srv
     act:<act_name>.action
   去注释化：
     msg:add_message_files
     srv:add_service_files
     act:add_action_files
   添加:
     find_package(catkin
动态参数的配置
节点配置
   检索：${PROJECT_NAME}_node
   替换：<node_name>
   去注释化：
      add_executable
      add_dependencies
      target_link_libraries
安装配置
```
