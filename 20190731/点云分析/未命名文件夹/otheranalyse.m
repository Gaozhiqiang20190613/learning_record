clc;clear all;
load ptcloud.mat;

ring = readField(ptcloud,'laser_id')+1; %获取激光点云的环号
azimuth = single(readField(ptcloud,'horizon_angle'))/100; %获取激光点云的方位角0.00~360.00

xyz = readXYZ(ptcloud);

xyzard = [xyz,azimuth,single(ring),sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2)];

new = sortrows(xyzard, [5,4]);

%环1
ring1 = new;
ring1(ring1(:,5) ~= 1,:) = [];
ring1hh = ring1;
ring1bh = ring1;
ring1hh(ring1hh(:,4) > 180,:) = [];
ring1bh(ring1bh(:,4) < 180,:) = [];
figure(1);
x1 = ring1hh(:,6).*cos(ring1hh(:,4).*pi/180);
y1 = ring1hh(:,6).*sin(ring1hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring1hh(:,7) = curvature;
% plot(x1, ring1hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
grid on
% figure(2);
x1 = ring1bh(:,6).*cos(ring1bh(:,4).*pi/180);
y1 = ring1bh(:,6).*sin(ring1bh(:,4).*pi/180);
% plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring1bh(:,7) = curvature;
% plot(x1, ring1bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring2 = new;
ring2(ring2(:,5) ~= 2,:) = [];
ring2hh = ring2;
ring2bh = ring2;
ring2hh(ring2hh(:,4) > 180,:) = [];
ring2bh(ring2bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring2hh(:,6).*cos(ring2hh(:,4).*pi/180);
y1 = ring2hh(:,6).*sin(ring2hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring2hh(:,7) = curvature;
% plot(x1, ring2hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring2bh(:,6).*cos(ring2bh(:,4).*pi/180);
y1 = ring2bh(:,6).*sin(ring2bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring2bh(:,7) = curvature;
% plot(x1, ring2bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环3
ring3 = new;
ring3(ring3(:,5) ~= 3,:) = [];
ring3hh = ring3;
ring3bh = ring3;
ring3hh(ring3hh(:,4) > 180,:) = [];
ring3bh(ring3bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring3hh(:,6).*cos(ring3hh(:,4).*pi/180);
y1 = ring3hh(:,6).*sin(ring3hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring3hh(:,7) = curvature;
% plot(x1, ring3hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring3bh(:,6).*cos(ring3bh(:,4).*pi/180);
y1 = ring3bh(:,6).*sin(ring3bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring3bh(:,7) = curvature;
% plot(x1, ring3bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环4
ring4 = new;
ring4(ring4(:,5) ~= 4,:) = [];
ring4hh = ring4;
ring4bh = ring4;
ring4hh(ring4hh(:,4) > 180,:) = [];
ring4bh(ring4bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring4hh(:,6).*cos(ring4hh(:,4).*pi/180);
y1 = ring4hh(:,6).*sin(ring4hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring4hh(:,7) = curvature;
% plot(x1, ring4hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring4bh(:,6).*cos(ring4bh(:,4).*pi/180);
y1 = ring4bh(:,6).*sin(ring4bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring4bh(:,7) = curvature;
% plot(x1, ring4bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环5
ring5 = new;
ring5(ring5(:,5) ~= 5,:) = [];
ring5hh = ring5;
ring5bh = ring5;
ring5hh(ring5hh(:,4) > 180,:) = [];
ring5bh(ring5bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring5hh(:,6).*cos(ring5hh(:,4).*pi/180);
y1 = ring5hh(:,6).*sin(ring5hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring5hh(:,7) = curvature;
% plot(x1, ring5hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring5bh(:,6).*cos(ring5bh(:,4).*pi/180);
y1 = ring5bh(:,6).*sin(ring5bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring5bh(:,7) = curvature;
% plot(x1, ring5bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环6
ring6 = new;
ring6(ring6(:,5) ~= 6,:) = [];
ring6hh = ring6;
ring6bh = ring6;
ring6hh(ring6hh(:,4) > 180,:) = [];
ring6bh(ring6bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring6hh(:,6).*cos(ring6hh(:,4).*pi/180);
y1 = ring6hh(:,6).*sin(ring6hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring6hh(:,7) = curvature;
% plot(x1, ring6hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring6bh(:,6).*cos(ring6bh(:,4).*pi/180);
y1 = ring6bh(:,6).*sin(ring6bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring6bh(:,7) = curvature;
% plot(x1, ring6bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环7
ring7 = new;
ring7(ring7(:,5) ~= 7,:) = [];
ring7hh = ring7;
ring7bh = ring7;
ring7hh(ring7hh(:,4) > 180,:) = [];
ring7bh(ring7bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring7hh(:,6).*cos(ring7hh(:,4).*pi/180);
y1 = ring7hh(:,6).*sin(ring7hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring7hh(:,7) = curvature;
% plot(x1, ring7hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring7bh(:,6).*cos(ring7bh(:,4).*pi/180);
y1 = ring7bh(:,6).*sin(ring7bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring7bh(:,7) = curvature;
% plot(x1, ring7bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环8
ring8 = new;
ring8(ring8(:,5) ~= 8,:) = [];
ring8hh = ring8;
ring8bh = ring8;
ring8hh(ring8hh(:,4) > 180,:) = [];
ring8bh(ring8bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring8hh(:,6).*cos(ring8hh(:,4).*pi/180);
y1 = ring8hh(:,6).*sin(ring8hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring8hh(:,7) = curvature;
% plot(x1, ring8hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring8bh(:,6).*cos(ring8bh(:,4).*pi/180);
y1 = ring8bh(:,6).*sin(ring8bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring8bh(:,7) = curvature;
% plot(x1, ring8bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环9
ring9 = new;
ring9(ring9(:,5) ~= 9,:) = [];
ring9hh = ring9;
ring9bh = ring9;
ring9hh(ring9hh(:,4) > 180,:) = [];
ring9bh(ring9bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring9hh(:,6).*cos(ring9hh(:,4).*pi/180);
y1 = ring9hh(:,6).*sin(ring9hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring9hh(:,7) = curvature;
% plot(x1, ring9hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring9bh(:,6).*cos(ring9bh(:,4).*pi/180);
y1 = ring9bh(:,6).*sin(ring9bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring9bh(:,7) = curvature;
% plot(x1, ring9bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环10
ring10 = new;
ring10(ring10(:,5) ~= 10,:) = [];
ring10hh = ring10;
ring10bh = ring10;
ring10hh(ring10hh(:,4) > 180,:) = [];
ring10bh(ring10bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring10hh(:,6).*cos(ring10hh(:,4).*pi/180);
y1 = ring10hh(:,6).*sin(ring10hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring10hh(:,7) = curvature;
% plot(x1, ring10hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring10bh(:,6).*cos(ring10bh(:,4).*pi/180);
y1 = ring10bh(:,6).*sin(ring10bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring10bh(:,7) = curvature;
% plot(x1, ring10bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环11
ring11 = new;
ring11(ring11(:,5) ~= 11,:) = [];
ring11hh = ring11;
ring11bh = ring11;
ring11hh(ring11hh(:,4) > 180,:) = [];
ring11bh(ring11bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring11hh(:,6).*cos(ring11hh(:,4).*pi/180);
y1 = ring11hh(:,6).*sin(ring11hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring11hh(:,7) = curvature;
ring11hh(:,8) = x1;
ring11hh(:,9) = y1;
% plot(x1, ring11hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring11bh(:,6).*cos(ring11bh(:,4).*pi/180);
y1 = ring11bh(:,6).*sin(ring11bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring11bh(:,7) = curvature;
% plot(x1, ring11bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环12
ring12 = new;
ring12(ring12(:,5) ~= 12,:) = [];
ring12hh = ring12;
ring12bh = ring12;
ring12hh(ring12hh(:,4) > 180,:) = [];
ring12bh(ring12bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring12hh(:,6).*cos(ring12hh(:,4).*pi/180);
y1 = ring12hh(:,6).*sin(ring12hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring12hh(:,7) = curvature;
% plot(x1, ring12hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring12bh(:,6).*cos(ring12bh(:,4).*pi/180);
y1 = ring12bh(:,6).*sin(ring12bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring12bh(:,7) = curvature;
% plot(x1, ring12bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环13
ring13 = new;
ring13(ring13(:,5) ~= 13,:) = [];
ring13hh = ring13;
ring13bh = ring13;
ring13hh(ring13hh(:,4) > 180,:) = [];
ring13bh(ring13bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring13hh(:,6).*cos(ring13hh(:,4).*pi/180);
y1 = ring13hh(:,6).*sin(ring13hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring13hh(:,7) = curvature;
% plot(x1, ring13hh(:,7), 'r');
ring13hh(:,8) = x1;
ring13hh(:,9) = y1;
% plot(ring13hh(:,8),ring13hh(:,4)/10,'bo');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring13bh(:,6).*cos(ring13bh(:,4).*pi/180);
y1 = ring13bh(:,6).*sin(ring13bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring13bh(:,7) = curvature;
% plot(x1, ring13bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环14
ring14 = new;
ring14(ring14(:,5) ~= 14,:) = [];
ring14hh = ring14;
ring14bh = ring14;
ring14hh(ring14hh(:,4) > 180,:) = [];
ring14bh(ring14bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring14hh(:,6).*cos(ring14hh(:,4).*pi/180);
y1 = ring14hh(:,6).*sin(ring14hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring14hh(:,7) = curvature;
% plot(x1, ring14hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring14bh(:,6).*cos(ring14bh(:,4).*pi/180);
y1 = ring14bh(:,6).*sin(ring14bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring14bh(:,7) = curvature;
% plot(x1, ring14bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环15
ring15 = new;
ring15(ring15(:,5) ~= 15,:) = [];
ring15hh = ring15;
ring15bh = ring15;
ring15hh(ring15hh(:,4) > 180,:) = [];
ring15bh(ring15bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring15hh(:,6).*cos(ring15hh(:,4).*pi/180);
y1 = ring15hh(:,6).*sin(ring15hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring15hh(:,7) = curvature;
% plot(x1, ring15hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring15bh(:,6).*cos(ring15bh(:,4).*pi/180);
y1 = ring15bh(:,6).*sin(ring15bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring15bh(:,7) = curvature;
% plot(x1, ring15bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环16
ring16 = new;
ring16(ring16(:,5) ~= 16,:) = [];
ring16hh = ring16;
ring16bh = ring16;
ring16hh(ring16hh(:,4) > 180,:) = [];
ring16bh(ring16bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring16hh(:,6).*cos(ring16hh(:,4).*pi/180);
y1 = ring16hh(:,6).*sin(ring16hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring16hh(:,7) = curvature;
% plot(x1, ring16hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring16bh(:,6).*cos(ring16bh(:,4).*pi/180);
y1 = ring16bh(:,6).*sin(ring16bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring16bh(:,7) = curvature;
% plot(x1, ring16bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring17 = new;
ring17(ring17(:,5) ~= 17,:) = [];
ring17hh = ring17;
ring17bh = ring17;
ring17hh(ring17hh(:,4) > 180,:) = [];
ring17bh(ring17bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring17hh(:,6).*cos(ring17hh(:,4).*pi/180);
y1 = ring17hh(:,6).*sin(ring17hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring17hh(:,7) = curvature;
ring17hh(:,8) = x1;
ring17hh(:,9) = y1;
% plot(x1, ring17hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring17bh(:,6).*cos(ring17bh(:,4).*pi/180);
y1 = ring17bh(:,6).*sin(ring17bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring17bh(:,7) = curvature;
% plot(x1, ring17bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring18 = new;
ring18(ring18(:,5) ~= 18,:) = [];
ring18hh = ring18;
ring18bh = ring18;
ring18hh(ring18hh(:,4) > 180,:) = [];
ring18bh(ring18bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring18hh(:,6).*cos(ring18hh(:,4).*pi/180);
y1 = ring18hh(:,6).*sin(ring18hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring18hh(:,7) = curvature;
% plot(x1, ring18hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring18bh(:,6).*cos(ring18bh(:,4).*pi/180);
y1 = ring18bh(:,6).*sin(ring18bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring18bh(:,7) = curvature;
% plot(x1, ring18bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring19 = new;
ring19(ring19(:,5) ~= 19,:) = [];
ring19hh = ring19;
ring19bh = ring19;
ring19hh(ring19hh(:,4) > 180,:) = [];
ring19bh(ring19bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring19hh(:,6).*cos(ring19hh(:,4).*pi/180);
y1 = ring19hh(:,6).*sin(ring19hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring19hh(:,7) = curvature;
% plot(x1, ring19hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring19bh(:,6).*cos(ring19bh(:,4).*pi/180);
y1 = ring19bh(:,6).*sin(ring19bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring19bh(:,7) = curvature;
% plot(x1, ring19bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring20 = new;
ring20(ring20(:,5) ~= 20,:) = [];
ring20hh = ring20;
ring20bh = ring20;
ring20hh(ring20hh(:,4) > 180,:) = [];
ring20bh(ring20bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring20hh(:,6).*cos(ring20hh(:,4).*pi/180);
y1 = ring20hh(:,6).*sin(ring20hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring20hh(:,7) = curvature;
% plot(x1, ring20hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring20bh(:,6).*cos(ring20bh(:,4).*pi/180);
y1 = ring20bh(:,6).*sin(ring20bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring20bh(:,7) = curvature;
% plot(x1, ring20bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring21 = new;
ring21(ring21(:,5) ~= 21,:) = [];
ring21hh = ring21;
ring21bh = ring21;
ring21hh(ring21hh(:,4) > 180,:) = [];
ring21bh(ring21bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring21hh(:,6).*cos(ring21hh(:,4).*pi/180);
y1 = ring21hh(:,6).*sin(ring21hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring21hh(:,7) = curvature;
% plot(x1, ring21hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring21bh(:,6).*cos(ring21bh(:,4).*pi/180);
y1 = ring21bh(:,6).*sin(ring21bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring21bh(:,7) = curvature;
% plot(x1, ring21bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring22 = new;
ring22(ring22(:,5) ~= 22,:) = [];
ring22hh = ring22;
ring22bh = ring22;
ring22hh(ring22hh(:,4) > 180,:) = [];
ring22bh(ring22bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring22hh(:,6).*cos(ring22hh(:,4).*pi/180);
y1 = ring22hh(:,6).*sin(ring22hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring22hh(:,7) = curvature;
% plot(x1, ring22hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring22bh(:,6).*cos(ring22bh(:,4).*pi/180);
y1 = ring22bh(:,6).*sin(ring22bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring22bh(:,7) = curvature;
% plot(x1, ring22bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring23 = new;
ring23(ring23(:,5) ~= 23,:) = [];
ring23hh = ring23;
ring23bh = ring23;
ring23hh(ring23hh(:,4) > 180,:) = [];
ring23bh(ring23bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring23hh(:,6).*cos(ring23hh(:,4).*pi/180);
y1 = ring23hh(:,6).*sin(ring23hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring23hh(:,7) = curvature;
ring23hh(:,8) = x1;
ring23hh(:,9) = y1;
% plot(x1, ring23hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring23bh(:,6).*cos(ring23bh(:,4).*pi/180);
y1 = ring23bh(:,6).*sin(ring23bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring23bh(:,7) = curvature;
% plot(x1, ring23bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring24 = new;
ring24(ring24(:,5) ~= 24,:) = [];
ring24hh = ring24;
ring24bh = ring24;
ring24hh(ring24hh(:,4) > 180,:) = [];
ring24bh(ring24bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring24hh(:,6).*cos(ring24hh(:,4).*pi/180);
y1 = ring24hh(:,6).*sin(ring24hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring24hh(:,7) = curvature;
% plot(x1, ring24hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring24bh(:,6).*cos(ring24bh(:,4).*pi/180);
y1 = ring24bh(:,6).*sin(ring24bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring24bh(:,7) = curvature;
% plot(x1, ring24bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring25 = new;
ring25(ring25(:,5) ~= 25,:) = [];
ring25hh = ring25;
ring25bh = ring25;
ring25hh(ring25hh(:,4) > 180,:) = [];
ring25bh(ring25bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring25hh(:,6).*cos(ring25hh(:,4).*pi/180);
y1 = ring25hh(:,6).*sin(ring25hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring25hh(:,7) = curvature;
% plot(x1, ring25hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring25bh(:,6).*cos(ring25bh(:,4).*pi/180);
y1 = ring25bh(:,6).*sin(ring25bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring25bh(:,7) = curvature;
% plot(x1, ring25bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring26 = new;
ring26(ring26(:,5) ~= 26,:) = [];
ring26hh = ring26;
ring26bh = ring26;
ring26hh(ring26hh(:,4) > 180,:) = [];
ring26bh(ring26bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring26hh(:,6).*cos(ring26hh(:,4).*pi/180);
y1 = ring26hh(:,6).*sin(ring26hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring26hh(:,7) = curvature;
% plot(x1, ring26hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring26bh(:,6).*cos(ring26bh(:,4).*pi/180);
y1 = ring26bh(:,6).*sin(ring26bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring26bh(:,7) = curvature;
% plot(x1, ring26bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring27 = new;
ring27(ring27(:,5) ~= 27,:) = [];
ring27hh = ring27;
ring27bh = ring27;
ring27hh(ring27hh(:,4) > 180,:) = [];
ring27bh(ring27bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring27hh(:,6).*cos(ring27hh(:,4).*pi/180);
y1 = ring27hh(:,6).*sin(ring27hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring27hh(:,7) = curvature;
% plot(x1, ring27hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring27bh(:,6).*cos(ring27bh(:,4).*pi/180);
y1 = ring27bh(:,6).*sin(ring27bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring27bh(:,7) = curvature;
% plot(x1, ring27bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring28 = new;
ring28(ring28(:,5) ~= 28,:) = [];
ring28hh = ring28;
ring28bh = ring28;
ring28hh(ring28hh(:,4) > 180,:) = [];
ring28bh(ring28bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring28hh(:,6).*cos(ring28hh(:,4).*pi/180);
y1 = ring28hh(:,6).*sin(ring28hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring28hh(:,7) = curvature;
% plot(x1, ring28hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring28bh(:,6).*cos(ring28bh(:,4).*pi/180);
y1 = ring28bh(:,6).*sin(ring28bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring28bh(:,7) = curvature;
% plot(x1, ring28bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring29 = new;
ring29(ring29(:,5) ~= 29,:) = [];
ring29hh = ring29;
ring29bh = ring29;
ring29hh(ring29hh(:,4) > 180,:) = [];
ring29bh(ring29bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring29hh(:,6).*cos(ring29hh(:,4).*pi/180);
y1 = ring29hh(:,6).*sin(ring29hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring29hh(:,7) = curvature;
% plot(x1, ring29hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring29bh(:,6).*cos(ring29bh(:,4).*pi/180);
y1 = ring29bh(:,6).*sin(ring29bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring29bh(:,7) = curvature;
% plot(x1, ring29bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring30 = new;
ring30(ring30(:,5) ~= 30,:) = [];
ring30hh = ring30;
ring30bh = ring30;
ring30hh(ring30hh(:,4) > 180,:) = [];
ring30bh(ring30bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring30hh(:,6).*cos(ring30hh(:,4).*pi/180);
y1 = ring30hh(:,6).*sin(ring30hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring30hh(:,7) = curvature;
% plot(x1, ring30hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring30bh(:,6).*cos(ring30bh(:,4).*pi/180);
y1 = ring30bh(:,6).*sin(ring30bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring30bh(:,7) = curvature;
% plot(x1, ring30bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring31 = new;
ring31(ring31(:,5) ~= 31,:) = [];
ring31hh = ring31;
ring31bh = ring31;
ring31hh(ring31hh(:,4) > 180,:) = [];
ring31bh(ring31bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring31hh(:,6).*cos(ring31hh(:,4).*pi/180);
y1 = ring31hh(:,6).*sin(ring31hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring31hh(:,7) = curvature;
% plot(x1, ring31hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring31bh(:,6).*cos(ring31bh(:,4).*pi/180);
y1 = ring31bh(:,6).*sin(ring31bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring31bh(:,7) = curvature;
% plot(x1, ring31bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

%环2
ring32 = new;
ring32(ring32(:,5) ~= 32,:) = [];
ring32hh = ring32;
ring32bh = ring32;
ring32hh(ring32hh(:,4) > 180,:) = [];
ring32bh(ring32bh(:,4) < 180,:) = [];
% figure(3);
x1 = ring32hh(:,6).*cos(ring32hh(:,4).*pi/180);
y1 = ring32hh(:,6).*sin(ring32hh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring32hh(:,7) = curvature;
% plot(x1, ring32hh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(4);
x1 = ring32bh(:,6).*cos(ring32bh(:,4).*pi/180);
y1 = ring32bh(:,6).*sin(ring32bh(:,4).*pi/180);
plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ring32bh(:,7) = curvature;
% plot(x1, ring32bh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
axis([-10,10,-10,10]);