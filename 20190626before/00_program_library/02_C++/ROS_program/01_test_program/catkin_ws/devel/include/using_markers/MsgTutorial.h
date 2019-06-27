// Generated by gencpp from file using_markers/MsgTutorial.msg
// DO NOT EDIT!


#ifndef USING_MARKERS_MESSAGE_MSGTUTORIAL_H
#define USING_MARKERS_MESSAGE_MSGTUTORIAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace using_markers
{
template <class ContainerAllocator>
struct MsgTutorial_
{
  typedef MsgTutorial_<ContainerAllocator> Type;

  MsgTutorial_()
    : x(0)
    , y(0)
    , z(0)  {
    }
  MsgTutorial_(const ContainerAllocator& _alloc)
    : x(0)
    , y(0)
    , z(0)  {
  (void)_alloc;
    }



   typedef int32_t _x_type;
  _x_type x;

   typedef int32_t _y_type;
  _y_type y;

   typedef int32_t _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::using_markers::MsgTutorial_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::using_markers::MsgTutorial_<ContainerAllocator> const> ConstPtr;

}; // struct MsgTutorial_

typedef ::using_markers::MsgTutorial_<std::allocator<void> > MsgTutorial;

typedef boost::shared_ptr< ::using_markers::MsgTutorial > MsgTutorialPtr;
typedef boost::shared_ptr< ::using_markers::MsgTutorial const> MsgTutorialConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::using_markers::MsgTutorial_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::using_markers::MsgTutorial_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace using_markers

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'using_markers': ['/root/catkin_ws/src/using_markers/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::using_markers::MsgTutorial_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::using_markers::MsgTutorial_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::using_markers::MsgTutorial_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::using_markers::MsgTutorial_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::using_markers::MsgTutorial_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::using_markers::MsgTutorial_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::using_markers::MsgTutorial_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3cb41a2c4416de195dbb95b7777a06fb";
  }

  static const char* value(const ::using_markers::MsgTutorial_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3cb41a2c4416de19ULL;
  static const uint64_t static_value2 = 0x5dbb95b7777a06fbULL;
};

template<class ContainerAllocator>
struct DataType< ::using_markers::MsgTutorial_<ContainerAllocator> >
{
  static const char* value()
  {
    return "using_markers/MsgTutorial";
  }

  static const char* value(const ::using_markers::MsgTutorial_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::using_markers::MsgTutorial_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 x\n\
int32 y\n\
int32 z\n\
";
  }

  static const char* value(const ::using_markers::MsgTutorial_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::using_markers::MsgTutorial_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MsgTutorial_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::using_markers::MsgTutorial_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::using_markers::MsgTutorial_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int32_t>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<int32_t>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // USING_MARKERS_MESSAGE_MSGTUTORIAL_H