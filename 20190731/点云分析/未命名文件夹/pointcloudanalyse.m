
% load ptcloud.mat;
% rosinit;
laser = rossubscriber('/velodyne_points_with_gps');
while(1)
% clc;close all;
ptcloud = receive(laser,10000);

ring = readField(ptcloud,'laser_id')+1; %获取激光点云的环号
azimuth = single(readField(ptcloud,'horizon_angle'))/100; %获取激光点云的方位角0.00~360.00

xyz = readXYZ(ptcloud);

xyzard = [xyz,azimuth,single(ring),sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2)];

new = sortrows(xyzard,[5,6,1,2,3]);
new1 = new;
new(new(:,6)<5,:) = [];
new(new(:,6)>28,:) = [];
new(new(:,3)>-1,:) = [];

i= length(new);
a1 = new(:,3);
a2 = new(:,3);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b1 = a2-a1;
b1(:,2)=1;
b1(b1(:,1)>0.01,2)=0;
b1(b1(:,1)<-0.01,2)=0;
b1 = b1';
b1(:,i) = 1;
b1 = b1';
new(:, 8) = b1(:,2);
new(new(:,8)<1,:) = [];

i= length(new);
a1 = new(:,2);
a2 = new(:,2);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b1 = a2-a1;
b1(:,2)=1;
b1(b1(:,1)>1,2)=0;
b1(b1(:,1)<-1,2)=0;
b1 = b1';
b1(:,i) = 1;
b1 = b1';
new(:, 8) = b1(:,2);
new(new(:,8)<1,:) = [];

i= length(new);
a1 = new(:,1);
a2 = new(:,1);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b1 = a2-a1;
b1(:,2)=1;
b1(b1(:,1)>0.006,2)=0;
b1(b1(:,1)<-0.006,2)=0;
b1 = b1';
b1(:,i) = 1;
b1 = b1';
new(:, 8) = b1(:,2);
new(new(:,8)<1,:) = [];

i= length(new);
a1 = new(:,6);
a2 = new(:,6);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b1 = a2-a1;
b1(:,2)=1;
b1(b1(:,1)>0.001,2)=0;
b1(b1(:,1)<-0.001,2)=0;
b1 = b1';
b1(:,i) = 1;
b1 = b1';
new(:, 8) = b1(:,2);
new(new(:,8)<1,:) = [];

road = new(:,1:3);
% road(:,1)=new(:,1);
% road(:,2)=new(:,2);
% road(:,3)=new(:,3);
road0 = mean(road,1);
centeredPlane=bsxfun(@minus,road,road0);
[U,S,V]=svd(centeredPlane);

a=V(1,3);
b=V(2,3);
c=V(3,3);
d=-dot([a b c],road0);


% xfit = min(new(:,1)):0.1:max(new(:,1));
% yfit = min(new(:,2)):0.1:max(new(:,2));
% [XFIT,YFIT]= meshgrid (xfit,yfit);
% ZFIT = -(d + a * XFIT + b * YFIT)/c;
% mesh(XFIT,YFIT,ZFIT);

j = 0.1;
new1(:,7) = (a*new1(:,1)+b*new1(:,2)+c*new1(:,3)+d);
new1(new1(:,7)>j,:) = [];
new1(new1(:,7)<-j,:) = [];
new1(new1(:,6)<3,:) = [];
new1(new1(:,6)>13,:) = [];

i= length(new1);
a1 = new1(:,6);
a2 = new1(:,6);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a1((i-1):(i-1)) = [];
a2(1:1) = [];
a2(2:2) = [];
a1 = a1';
a2 = a2';
b1 = a2-a1;
b1(:,2)=1;
b1(b1(:,1)>0.0001,2)=0;
b1(b1(:,1)<-0.0001,2)=0;
b1 = b1';
b1(:,(i-1)) = 1;
b1(:,i) = 1;
b1 = b1';
new1(:, 8) = b1(:,2);
new1(new1(:,8)<1,:) = [];


%方案：从点来确定道路的宽度
%评价：不可用，因为道路可能不平行于实际的xyz轴，使用该方式将会导致所得到的直线并不满足道路的边界
new1 = sortrows(new1,1);
xminv = new1(:,1);
xminv = xminv';
i = length(xminv);
xmaxv = xminv(:,fix(0.99*i):i);
xminv = xminv(:,1:fix(0.01*i));
xmaxv = xmaxv';
xminv = xminv';

xmin = mean(xminv);
xmax = mean(xmaxv);

x = new1(:,1);
y = new1(:,2);
z = new1(:,3);

pxy = polyfit(x,y,1);
pxz = polyfit(x,z,1);
pyz = polyfit(y,z,1);

spxy = polyfit(x,y,3);


new1(:,9) = spxy(1,1).* (x).^3 + spxy(1,2).* (x).^2 + spxy(1,3).* (x) + spxy(1,4);
new1(new1(:,9)>(mean(new1(:,9))*1.5),:) = [];
x = new1(:,1);
y = new1(:,2);
z = new1(:,3);
spxy = polyfit(x,y,3);


spxz = polyfit(x,z,3);
spyz = polyfit(y,z,3);

ymin = pxy(1,1) * xmin + pxy(1,2);
zmin = pxz(1,1) * xmin + pxz(1,2);

%symin = pxy(1,1) * xmin^3 + pxy(1,2) * xmin^2 + pxy(1,3) * xmin + pxy(1,4);
%szmin = pxz(1,1) * xmin^3 + pxz(1,2) * xmin^2 + pxz(1,3) * xmin + pxz(1,4);

% hold on;
%drawnow
ymax = pxy(1,1) * xmax + pxy(1,2);
zmax = pxz(1,1) * xmax + pxz(1,2);

%symax = pxy(1,1) * xmax^3 + pxy(1,2) * xmax^2 + pxy(1,3) * xmax + pxy(1,4);
%szmax = pxz(1,1) * xmax^3 + pxz(1,2) * xmax^2 + pxz(1,3) * xmax + pxz(1,4);

point1 = [xmin ymin zmin];
point2 = [xmax ymax zmax];
%point3 = [xmin,symin,szmin];
%point4 = [xmax,symax,szmax];

sx = xmin:0.01:xmax;
sy = spxy(1,1).* (sx).^3 + spxy(1,2).* (sx).^2 + spxy(1,3).* (sx) + spxy(1,4);
sz = spxz(1,1).* (sx).^3 + spxz(1,2).* (sx).^2 + spxz(1,3).* (sx) + spxz(1,4);

%plot3([xmin,xmax],[ymin,ymax],[zmin,zmax],'-b.');
% hold on;
%drawnow
xl = [xmin,xmax];
yl = [ymin,ymax];
zl = [zmin,zmax];

new1 = sortrows(new1,2);
yminv = new1(:,2);
yminv = yminv';
i = length(yminv);
ymaxv = yminv(:,fix(0.8*i):i);
yminv = yminv(:,1:fix(0.2*i));
ymaxv = ymaxv';
yminv = yminv';
ymin1 = mean(yminv);
ymax1 = mean(ymaxv);
zmin1 = pyz(1,1) * ymin1 + pyz(1,2);
zmax1 = pyz(1,1) * ymax1 + pyz(1,2);

xmin1 = -(b/a) * ymin1 - (c/a) * zmin1 - (d/a);
xmax1 = -(b/a) * ymax1 - (c/a) * zmax1 - (d/a);

v1 = xmax - xmin;
v2 = ymax - ymin;
v3 = zmax - zmin;

xmax11 = xmax1 - v1;
xmax12 = xmax1 + v1;
xmin11 = xmin1 + v1;
xmin12 = xmin1 - v1;
ymax11 = ymax1 - v2;
ymax12 = ymax1 + v2;
ymin11 = ymin1 + v2;
ymin12 = ymin1 - v2;
zmax11 = zmax1 - v3;
zmax12 = zmax1 + v3;
zmin11 = zmin1 + v3;
zmin12 = zmin1 - v3;

point5 = [xmax11 ymax11 zmax11];
point6 = [xmax12 ymax12 zmax12];
point7 = [xmin11 ymin11 zmin11];
point8 = [xmin12 ymin12 zmin12];
m = [linspace(point5(1),point6(1),1000); linspace(point5(2),point6(2),1000); linspace(point5(3),point6(3),1000)];
n = [linspace(point7(1),point8(1),1000); linspace(point7(2),point8(2),1000); linspace(point7(3),point8(3),1000)];
% scatter3(xyzard(:,1),xyzard(:,2),xyzard(:,3),'r.')
% drawnow;plot3(xyzard(:,1),xyzard(:,2),xyzard(:,3),'r.');hold on;
% drawnow(10000)
figure(1);
drawnow;plot3(new1(:,1),new1(:,2),new1(:,3),'b.',xyzard(:,1),xyzard(:,2),xyzard(:,3),'r.',[m(1,:),n(1,:)],[m(2,:),n(2,:)],[m(3,:),n(3,:)],'-bo',[xmin,xmax],[ymin,ymax],[zmin,zmax],'-b.',sx, sy, sz, '-go');
view(0,90);
axis([-10,10,-10,10]);
% figure(2);
% drawnow;plot3(new1(:,1),new1(:,2),new1(:,3),'r.',[xmin,xmax],[ymin,ymax],[zmin,zmax],'-b.',sx, sy, sz, '-go');
% view(0,90);
% figure(3);
% drawnow;plot3(new(:,1),new(:,2),new(:,3),'r.',[xmin,xmax],[ymin,ymax],[zmin,zmax],'-b.',sx, sy, sz, '-go');
% view(0,90);
xlabel('X');
ylabel('Y');
zlabel('Z');
% drawnow(10000)
% plot3(n(1,:),n(2,:),n(3,:),'-bo');
% drawnow
end
