clc;clear all;
load ptcloud.mat;

ring = readField(ptcloud,'laser_id')+1; %获取激光点云的环号
azimuth = single(readField(ptcloud,'horizon_angle'))/100; %获取激光点云的方位角0.00~360.00

xyz = readXYZ(ptcloud);

xyzard = [xyz,azimuth,single(ring),sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2)];

new = sortrows(xyzard, [5,4]);

ring = new;
ring(ring(:,5) ~= 17,:) = [];

% ringhh = ring;
% ringbh = ring;
% ringhh(ringhh(:,4) > 180,:) = [];
% ringbh(ringbh(:,4) < 180,:) = [];
% figure(1);

x = ring(:,1);
y = ring(:,2);
z = ring(:,3);
% x1 = ringhh(:,6).*cos(ringhh(:,4).*pi/180);
% y1 = ringhh(:,6).*sin(ringhh(:,4).*pi/180);
% plot(x1,y1,'o');

ppxy = csape(x,y);
hold on;
ppxz = csape(x,z);
hold on;
ppyz = csape(y,z);
hold on;
% plot(x1, fnval(pp,x1),'g');
ppxy1 = fnval(fnder(ppxy,1),x);  %求一阶导
ppxy2 = fnval(fnder(ppxy,2),x);  %求二阶导

ppxz1 = fnval(fnder(ppxz,1),x);  %求一阶导
ppxz2 = fnval(fnder(ppxz,2),x);  %求二阶导

ppyz1 = fnval(fnder(ppyz,1),x);  %求一阶导
ppyz2 = fnval(fnder(ppyz,2),x);  %求二阶导

curvaturexy = abs(ppxy2) ./ sqrt((1+ppxy1 .^ 2) .^ 3);
curvaturexz = abs(ppxz2) ./ sqrt((1+ppxz1 .^ 2) .^ 3);
curvatureyz = abs(ppyz2) ./ sqrt((1+ppyz1 .^ 2) .^ 3);
ring(:,7) = curvaturexy;
ring(:,8) = curvaturexz;
ring(:,9) = curvatureyz;

% figure(1)
% plot(ring(:,1),ring(:,2),'ro');
% 
% figure(2)
% plot(ring(:,1),ring(:,3),'ro');
% 
% figure(3)
% plot(ring(:,2),ring(:,3),'ro');

figure(1)
plot3(ring(:,1),ring(:,2),ring(:,3),'ro');
hold on;
plot3(xyzard(:,1),xyzard(:,2),xyzard(:,3),'b.');
hold on;
% plot(x1, ringhh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on
% figure(2);
% x1 = ringbh(:,6).*cos(ringbh(:,4).*pi/180);
% y1 = ringbh(:,6).*sin(ringbh(:,4).*pi/180);
% plot(x1,y1,'o');

% pp = csape(x1,y1);
% hold on;
% plot(x1, fnval(pp,x1),'g');
% pp1 = fnval(fnder(pp,1),x1);  %求一阶导
% pp2 = fnval(fnder(pp,2),x1);  %求二阶导
% 
% curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
% ringbh(:,7) = curvature;
% plot(x1, ringbh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
% grid on

point1 = ring;
point1(point1(:,7)>0.002,:) = [];
point1(point1(:,7)<0.001,:) = [];
point1(point1(:,8)<3.5725,:) = [];
point1(point1(:,8)>5.5725,:) = [];
point1(point1(:,9)>0.1307,:) = [];
point1(point1(:,9)<0.0307,:) = [];

plot3(point1(:,1),point1(:,2),point1(:,3),'g*');