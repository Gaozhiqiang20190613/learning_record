##catkin功能包选项,描述了库、catkin构建依赖项和系统依赖的功能包。
catkin_package(
  LIBRARIES ros_tutorials_topic
  CATKIN_DEPENDS std_msgs roscpp
)

##设置包含目录。
include_directories(${catkin_INCLUDE_DIRS})
##topic_publisher节点的构建选项。
##配置可执行文件、目标链接库和其他依赖项。
add_executable(topic_publisher src/topic_publisher.cpp)
add_dependencies(topic_publisher ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(topic_publisher${catkin_LIBRARIES})
##topic_subscriber节点的构建选项。
add_executable(topic_subscriber src/topic_subscriber.cpp)
add_dependencies(topic_subscriber ${${PROJECT_NAME}_EXPORTED_TARGETS}${catkin_EXPORTED_TARGETS})
target_link_libraries(topic_subscriber${catkin_LIBRARIES})
