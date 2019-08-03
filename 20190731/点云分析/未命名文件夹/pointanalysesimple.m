% clc;clear;
load ptcloud.mat;

ring = readField(ptcloud,'laser_id')+1; %获取激光点云的环号
azimuth = single(readField(ptcloud,'horizon_angle'))/100; %获取激光点云的方位角0.00~360.00

xyz = readXYZ(ptcloud);

xyzard = [xyz,azimuth,single(ring),sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2)];

new = sortrows(xyzard, [5,4]);

%环1
ring = new;
ring(ring(:,5) ~= 11,:) = [];
% ringhh = ring;
% ringbh = ring;
% ringhh(ringhh(:,4) > 180,:) = [];
% ringbh(ringbh(:,4) < 180,:) = [];
% figure(1);
x1 = ring(:,6).*cos(ring(:,4).*pi/180);
y1 = ring(:,6).*sin(ring(:,4).*pi/180);
% plot(x1,y1,'o');

pp = csape(x1,y1);
hold on;
% plot(x1, fnval(pp,x1),'g');
pp1 = fnval(fnder(pp,1),x1);  %求一阶导
pp2 = fnval(fnder(pp,2),x1);  %求二阶导

curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
ringhh(:,7) = curvature;
% plot(x1, ringhh(:,7), 'r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
grid on
% figure(2);
% x1 = ringbh(:,6).*cos(ringbh(:,4).*pi/180);
% y1 = ringbh(:,6).*sin(ringbh(:,4).*pi/180);
% plot(x1,y1,'o');

% pp = csape(x1,y1);
% hold on;
% plot(x1, fnval(pp,x1),'g');
% pp1 = fnval(fnder(pp,1),x1);  %求一阶导
% pp2 = fnval(fnder(pp,2),x1);  %求二阶导

% curvature = abs(pp2) ./ sqrt((1+pp1 .^ 2) .^ 3);
% ringbh(:,7) = curvature;
ring(:,8) = x1;
ring(:,9) = y1;
figure(33);
%plot(ringhh(:,8), fnval(pp,x1),'-g',ringhh(:,8), ringhh(:,9),'o',ringhh(:,8), ringhh(:,4)/10,'-bo',ringhh(:,8), ringhh(:,7),'-r');
% legend('原始离散点', 'Spline拟合结果', '曲率图');
grid on
axis([-10,10,-5,20]);