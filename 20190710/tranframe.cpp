#include <iostream>
#include <cmath>
#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/Geometry>

int main()
{
  //分别创建旋转矩阵、旋转向量、四元数
  Eigen::Matrix3d R = Eigen::Matrix3d::Identity();
  //Eigen::AngleAxisd v(M_PI/2, Eigen::Vector3d(0,1,0));
  Eigen::Quaterniond q;//(0.7033, -0.4054, 0.0042, 0.5839);
  Eigen::Vector3d euler_angles;

  R << 0.3180,   -0.8248,   -0.4676,
       0.8179,   -0.0107,    0.5752,
      -0.4794,   -0.5654,    0.6712;

  //旋转矩阵转欧拉角
  //euler_angles = R.eulerAngles(2, 1, 0);
  //std::cout << "yaw(Z) pitch(Y) roll(X)=\n" << euler_angles.transpose() << std::endl;
  /*----------------------------------------------
  yaw(Z) pitch(Y) roll(X)=
  1.19998  0.499968 -0.700016
  ----------------------------------------------*/
  //

  //旋转矩阵转换成四元数
  //q = Eigen::Quaterniond(R);
  //std::cout << "q:\n" << q.coeffs() << std::endl;
  /*---------------------------------------------
  q:(R->q)
    -0.405448    x
    0.00419454   y
    0.583929     z
    0.703296     w
  ---------------------------------------------*/

  //四元数转换成矩阵
  //R = Eigen::Matrix3d(q);
  //std::cout << "R:\n" << R << std::endl;
  /*---------------------------------------------
  R:(q->R)
    0.318086  -0.824719  -0.467518
    0.817908  -0.0105767  0.57514
   -0.479334  -0.565331   0.671266
  ---------------------------------------------*/

  // q = Eigen::Quaterniond(v);
  // std::cout << "q:\n" << q.coeffs() << std::endl;
  //
  // R = v.toRotationMatrix();
  // std::cout << "R:\n" << R << std::endl;

  return 0;
}


// #include <iostream>
// #include <eigen3/Eigen/Dense>
//
// using namespace std;
// using namespace Eigen;
//
// int main(int argc, char *argv[])
// {
//     /*Matrix2f A, Ainv;
//     Matrix2f I= Matrix2f::Identity(2,2); // I is an identity matrix
//     A << 2,-1,-1,3;
//     Ainv= A.ldlt().solve(I);    // ldlt() can be replaced by other decomposition solvers
//     cout << "The matrix A is:\n" << A << endl;
//     cout << "The inversion of matrix A is:\n" << Ainv << endl;*/
//
//     MatrixXd  A;
//     A.resize(3, 1);
//     A << 5,
//          8,
//          2;
//     Matrix3d R_x;
//     R_x << 1, 0, 0,
//            0, 1, 0,
//            0, 0, 1;
//     MatrixXd Fin = R_x * A;
//     cout << Fin << endl;
//     return 0;
// }

/*#include <iostream>
#include <eigen3/Eigen/Dense>
using namespace Eigen;
int main()
{
  MatrixXd m(2,5);
  m.resize(4,3);
  std::cout << "The matrix m is of size "
            << m.rows() << "x" << m.cols() << std::endl;
  std::cout << "It has " << m.size() << " coefficients" << std::endl;
  VectorXd v(2);
  v.resize(5);
  std::cout << "The vector v is of size " << v.size() << std::endl;
  std::cout << "As a matrix, v is of size "
            << v.rows() << "x" << v.cols() << std::endl;
}*/


/*
#include <vector>
#include <eigen3/Eigen/Geometry>
#include <stdio.h>
#include <iostream>
#define Scalar double

 Eigen::Transform<Scalar, 3, Eigen::Affine> findTransformBetween2CS(const Eigen::Matrix<Scalar, Eigen::Dynamic, 1> from_line_x,
                                        const Eigen::Matrix<Scalar, Eigen::Dynamic, 1> from_line_y,
                                        const Eigen::Matrix<Scalar, Eigen::Dynamic, 1> to_line_x,
                                        const Eigen::Matrix<Scalar, Eigen::Dynamic, 1> to_line_y)
{

// Convert lines into Vector3 :
  Eigen::Matrix<Scalar, 3, 1> fr0 (from_line_x.template head<3>()),
                              fr1 (from_line_x.template head<3>() + from_line_x.template tail<3>()),
                              fr2 (from_line_y.template head<3>() + from_line_y.template tail<3>()),

                              to0 (to_line_x.template head<3>()),
                              to1 (to_line_x.template head<3>() + to_line_x.template tail<3>()),
                              to2 (to_line_y.template head<3>() + to_line_y.template tail<3>());

  // Code is inspired from http://stackoverflow.com/a/15277421/1816078
  // Define matrices and points :
  Eigen::Transform<Scalar, 3, Eigen::Affine> T, T1, T2 = Eigen::Transform<Scalar, 3, Eigen::Affine>::Identity ();
  Eigen::Matrix<Scalar, 3, 1> x1, y1, x2, y2;

    // Axes of the coordinate system "fr"
    x1 = (fr1 - fr0).normalized(); // the versor (unitary vector) of the (fr1-fr0) axis vector
    y1 = (fr2 - fr0).normalized();

    // Axes of the coordinate system "to"
    x2 = (to1 - to0).normalized();
    y2 = (to2 - to0).normalized();

    // transform from CS1 to CS2
    // Note: if fr0==(0,0,0) --> CS1==CS2 --> T2=Identity
    T1.linear() << x1, y1, x1.cross(y1);

    // transform from CS1 to CS3
    T2.linear() << x2, y2, x2.cross(y2);

    // T = transform to CS2 to CS3
    // Note: if CS1==CS2 --> T = T3
    // T.linear() = T2.linear() * T1.linear().inverse();

    // T.translation() = to0;
  	T.linear () = T2.linear () * T1.linear ().inverse ();
  	// T.translation() = to0;
  	T.translation () = to0 - (T.linear () * fr0);
    return T;
}

int main(int argc, char const *argv[])
{
	Eigen::Transform<Scalar, 3, Eigen::Affine> transformation;
	Eigen::Matrix<Scalar, 6, 1>  from_line_x;
	Eigen::Matrix<Scalar, 6, 1>  from_line_y;
	Eigen::Matrix<Scalar, 6, 1>  to_line_x;
	Eigen::Matrix<Scalar, 6, 1>  to_line_y;

	from_line_x << 1234.56, 0.0, 0.0, 0.00387281179, 0.00572064891, -0.999976099;
	from_line_y << 1234.56, 0.0, 0.0, 0.6113801, -0.79133445, -0.00202810019;
	to_line_x << 0, 0, 0, 1, 0, 0;
	to_line_y << 0, 0, 0, 0, 1, 0;

	transformation = findTransformBetween2CS (from_line_x, from_line_y, to_line_x, to_line_y);
	std::cout<< "transformation" <<std::endl;
	std::cout<< transformation.matrix() <<std::endl;

	Eigen::Vector3d from_test_x, to_test_x;
	from_test_x = {1,1,2};

	std::cout<< "from_test_x" <<std::endl;
	std::cout<< from_test_x <<std::endl;

 	to_test_x = transformation.linear() * from_test_x;
 	// std::cout << transformation.linear() <<std::endl;
 	std::cout<< to_test_x <<std::endl;

	return 0;
}*/
