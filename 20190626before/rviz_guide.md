# rviz教程运行记录
## 一、basic_shapes、point_and_lines
```
$ catkin_create_pkg using_markers roscpp visualization_msgs

将程序拷贝到using_markers的src文件夹下

CMakeLists.txt modity:
add_executable(basic_shapes src/basic_shapes.cpp)
add_dependencies(basic_shapes ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(basic_shapes ${catkin_LIBRARIES})

add_executable(points_and_lines src/point_sand_lines.cpp)
add_dependencies(points_and_lines ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(points_and_lines ${catkin_LIBRARIES})

$ catkin_make
$ source devel/setup.bash
$ rosrun using_markers basic_shapes
$ rviz

$ catkin_make
$ source devel/setup.bash
$ rosrun using_markers point_and_lines
$ rviz
```

## 二、Interactive Markers
### 1、Getting Started
#### （1）simple_marker
```
将interactive_marker_tutorials目录拷贝到ros空间的src目录下

$ catkin_make
$ source devel/setup.bash
$ rosrun interactive_marker_tutorials simple_marker
$ rviz

在rviz下
Global Options->Fixed Frame:/base_link
add interactiveMarkers
interactiveMarkers->Update Topic:/simple_marker/update
```

#### （2）others
```
$ rosrun interactive_marker_tutorials <node_name>
interactiveMarkers->Update Topic:/<node_name>/update
```
