#include <iostream>
#include <cmath>
#include <eigen3/Eigen/Core>
// Eigen 几何模块
#include <eigen3/Eigen/Geometry>

using namespace std;

int main ( int argc, char** argv )
{

    //旋转矩阵R
    //3X3的旋转矩阵可以用Matrix3d，也Matrix3f
    Eigen::Matrix3d R=Eigen::Matrix3d::Identity();//将其赋值为单位矩阵
//    Eigen::Matrix3d R;
//    R.setIdentity();  //也是将旋转矩阵赋值为单位矩阵，与上面效果一样
    cout<<"R= \n"<<R<<endl;

    //旋转向量v（轴角）
    //旋转向量使用AngleAxisd(f),底层不直接是Matrix，但因为重载了运算符，运算可以当作矩阵
    Eigen::AngleAxisd v(M_PI/4,Eigen::Vector3d(0,0,1));//沿z轴旋转了45度
    cout << "rotation vector: Angle is: " << v.angle() * (180 / M_PI)<<endl//旋转角
         << "  Axis is: " << v.axis().transpose() << endl<<endl;//旋转轴
    //将旋转向量转换为旋转矩阵
    //方式一：用matrix()
//    R=v.matrix();
    //方式二：用toRotationMatrix()
    R=v.toRotationMatrix();
    cout<<"R=\n"<<R<<endl<<endl;
    //将旋转向量转化为四元数q
    Eigen::Quaterniond q = Eigen::Quaterniond(v);
    cout<<"q=\n"<<q.coeffs()<<endl<<endl;//coeffs的顺序:(x,y,z,w)
    cout<<"q=\n"<<q.x()<<endl<<q.y()<<endl<<q.z()<<endl<<q.w()<<endl<<endl;//四元数的另一种输出方式


    //将旋转矩阵转化为四元数
    q = Eigen::Quaterniond(R);
     cout<<"q=\n"<<q.coeffs()<<endl<<endl;
    //将旋转矩阵转化为欧拉角
     Eigen::Vector3d euler_angles=R.eulerAngles(2,1,0);
     cout<<"yaw(Z) pitch(Y) roll(X)=\n"<<euler_angles.transpose()<<endl<<endl;


     //将四元数转化为旋转矩阵
     R=Eigen::Matrix3d(q);
     cout<<"R=\n"<<R<<endl<<endl;

     //将四元数转化为旋转向量
     v=Eigen::AngleAxisd(q);
     cout<<v.matrix()<<endl<<endl;
        return 0;
}
