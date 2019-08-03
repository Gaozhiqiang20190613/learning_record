
load ptcloud.mat;

    ring = readField(ptcloud,'laser_id')+1; %获取激光点云的环号
    azimuth = single(readField(ptcloud,'horizon_angle'))/100; %获取激光点云的方位角0.00~360.00
    
    xyz = readXYZ(ptcloud); 
   
    xyzard = [xyz,azimuth,single(ring),sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2)]; 
    
% new = sortrows(xyzard,6);
% new(:, 7) = 10;
% i = 1;
% while(i< 58319)
%     while((new{i+1, 6}-new{i, 6})>0.5)
%         new{i, 8} = 0;
%     end
%     i = i + 1;
% end

new = sortrows(xyzard,[5,6,1,2,3]);
new1 = new;
new(new(:,6)<5,:) = [];
new(new(:,6)>28,:) = [];
new(new(:,3)>-1,:) = [];
% a3 = new(:,5);
% a4 = new(:,5);
% a3 = a3';
% a4 = a4';
% a3(11665:11665) = [];
% a4(1:1) = [];
% a3 = a3';
% a4 = a4';
% b1 = a4-a3;
% b1(:,2)=1;
% 
% b1(b1(:,1)>0,2)=0;
% b1 = b1';
% b1(:,11665) = 1;
% b1 = b1';
% new(:, 8) = b1(:,2);
% new(new(:,8)>0,:) = [];

% a1 = new(:,6);
% a2 = new(:,6);
% a1 = a1';
% a2 = a2';
% a1(15603:15603) = [];
% a2(1:1) = [];
% a1 = a1';
% a2 = a2';
% b = a2-a1;
% b(:,2)=1;
% b(b(:,1)>0.01,2)=0;
% b = b';
% b(:,15603) = 1;
% b = b';
% new(:, 8) = b(:,2);
% new(new(:,8)<1,:) = [];
% 
% a1 = new(:,6);
% a2 = new(:,6);
% a1 = a1';
% a2 = a2';
% a1(13366:13366) = [];
% a2(1:1) = [];
% a1 = a1';
% a2 = a2';
% b = a2-a1;
% b(:,2)=1;
% b(b(:,1)>0.01,2)=0;
% b = b';
% b(:,13366) = 1;
% b = b';
% new(:, 8) = b(:,2);
% new(new(:,8)<1,:) = [];
% 
% a1 = new(:,6);
% a2 = new(:,6);
% a1 = a1';
% a2 = a2';
% a1(12406:12406) = [];
% a1(12405:12405) = [];
% a1(12404:12404) = [];
% a1(12403:12403) = [];
% a2(1:1) = [];
% a2(2:2) = [];
% a2(3:3) = [];
% a2(4:4) = [];
% a1 = a1';
% a2 = a2';
% b = a2-a1;
% b(:,2)=1;
% b(b(:,1)>0.01,2)=0;
% b = b';
% b(:,12403) = 1;
% b(:,12404) = 1;
% b(:,12405) = 1;
% b(:,12406) = 1;
% b = b';
% new(:, 8) = b(:,2);
% new(new(:,8)<1,:) = [];
i= 15603;
a1 = new(:,3);
a2 = new(:,3);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b = a2-a1;
b(:,2)=1;
b(b(:,1)>0.01,2)=0;
b(b(:,1)<-0.01,2)=0;
b = b';
b(:,i) = 1;
b = b';
new(:, 8) = b(:,2);
new(new(:,8)<1,:) = [];

i = 15342;
a1 = new(:,2);
a2 = new(:,2);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b = a2-a1;
b(:,2)=1;
b(b(:,1)>1,2)=0;
b(b(:,1)<-1,2)=0;
b = b';
b(:,i) = 1;
b = b';
new(:, 8) = b(:,2);
new(new(:,8)<1,:) = [];

i = 10528;
a1 = new(:,1);
a2 = new(:,1);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b = a2-a1;
b(:,2)=1;
b(b(:,1)>0.006,2)=0;
b(b(:,1)<-0.006,2)=0;
b = b';
b(:,i) = 1;
b = b';
new(:, 8) = b(:,2);
new(new(:,8)<1,:) = [];
% 
% i = 765;
% a1 = new(:,6);
% a2 = new(:,6);
% a1 = a1';
% a2 = a2';
% a1(i:i) = [];
% a2(1:1) = [];
% a1 = a1';
% a2 = a2';
% b = a2-a1;
% b(:,2)=1;
% b(b(:,1)>0.001,2)=0;
% b = b';
% b(:,i) = 1;
% b = b';
% new(:, 8) = b(:,2);
% new(new(:,8)<1,:) = [];

i = 805;
a1 = new(:,6);
a2 = new(:,6);
a1 = a1';
a2 = a2';
a1(i:i) = [];
a2(1:1) = [];
a1 = a1';
a2 = a2';
b = a2-a1;
b(:,2)=1;
b(b(:,1)>0.001,2)=0;
b(b(:,1)<-0.001,2)=0;
b = b';
b(:,i) = 1;
b = b';
new(:, 8) = b(:,2);
new(new(:,8)<1,:) = [];

road(:,1)=new(:,1);
road(:,2)=new(:,2);
road(:,3)=new(:,3);
road0 = mean(road,1);
centeredPlane=bsxfun(@minus,road,road0);
[U,S,V]=svd(centeredPlane);

a=V(1,3);
b=V(2,3);
c=V(3,3);
d=-dot([a b c],road0);

figure(1)
scatter3(new1(:,1),new1(:,2),new1(:,3),'r.')
hold on
xfit = min(new(:,1)):0.1:max(new(:,1));
yfit = min(new(:,2)):0.1:max(new(:,2));
[XFIT,YFIT]= meshgrid (xfit,yfit);
ZFIT = -(d + a * XFIT + b * YFIT)/c;
mesh(XFIT,YFIT,ZFIT);

% figure(2)
% plot3(new(:,1),new(:,2),new(:,3),'r.');
% view(0,90)%

% figure(2)
% plot3(xyzard(:,1),xyzard(:,2),xyzard(:,3),'r.');
j = 0.03
new1(:,7) = (a*new1(:,1)+b*new1(:,2)+c*new1(:,3)+d);
new1(new1(:,7)>j,:) = [];
new1(new1(:,7)<-j,:) = [];
new1(new1(:,6)<5,:) = [];
new1(new1(:,6)>13,:) = [];
%figure(3)


% x = new1(:,1);
% y = new1(:,2);
% z = new1(:,3);

% i = 3286;
% k = 0.001;
% a1 = new1(:,6);
% a2 = new1(:,6);
% a1 = a1';
% a2 = a2';
% a1(i:i) = [];
% a2(1:1) = [];
% a1 = a1';
% a2 = a2';
% b = a2-a1;
% b(:,2)=1;
% b(b(:,1)>k,2)=0;
% b(b(:,1)<-k,2)=0;
% b = b';
% b(:,i) = 1;
% b = b';
% new1(:, 8) = b(:,2);
% new1(new1(:,8)<1,:) = [];
% 
% i = 2019;
% k = 0.001;
% a1 = new1(:,6);
% a2 = new1(:,6);
% a1 = a1';
% a2 = a2';
% a1(i:i) = [];
% a2(1:1) = [];
% a1 = a1';
% a2 = a2';
% b = a2-a1;
% b(:,2)=1;
% b(b(:,1)>k,2)=0;
% b(b(:,1)<-k,2)=0;
% b = b';
% b(:,i) = 1;
% b = b';
% new1(:, 8) = b(:,2);
% new1(new1(:,8)<1,:) = [];

% plot3(new1(:,1),new1(:,2),new1(:,3),'r.');
% hold on;

%方案：从点来确定道路的宽度
%评价：不可用，因为道路可能不平行于实际的xyz轴，使用该方式将会导致所得到的直线并不满足道路的边界
new1 = sortrows(new1,1);
xminv = new1(:,1);
xminv = xminv';
xmaxv = xminv(:,3490:3540);
xminv = xminv(:,1:50);
xmaxv = xmaxv';
xminv = xminv';
% new1 = sortrows(new1,3);
% zminv = new1(:,3);
% zminv = zminv';
% zmaxv = zminv(:,1206:1306);
% zminv = zminv(:,1:100);
% zmaxv = zmaxv';
% zminv = zminv';
% 
% 
xmin = mean(xminv);
xmax = mean(xmaxv);
% zmin = mean(zminv);
% zmax = mean(zmaxv);
% 
% xarrang1 = new1;
% xarrang2 = new1;
% 
% 
% xarrang1(xarrang1(:,1)<4,:) = [];
% xarrang2(xarrang2(:,1)>-7,:) = [];
% 
% zarrang3 = xarrang2;
% zarrang4 = xarrang1;
% 
% zarrang3(zarrang3(:,3)<zmax,:) = [];
% zarrang4(zarrang4(:,3)>zmin,:) = [];
% 
% 
% zarrang3 = sortrows(zarrang3,2);
% yminv1 = zarrang3(:,2);
% yminv1 = yminv1';
% ymaxv1 = yminv1(:,127:132);
% yminv1 = yminv1(:,1:5);
% ymaxv1 = ymaxv1';
% yminv1 = yminv1';
% 
% zarrang4 = sortrows(zarrang4,2);
% yminv2 = zarrang4(:,2);
% yminv2 = yminv2';
% ymaxv2 = yminv2(:,44:49);
% yminv2 = yminv2(:,1:5);
% ymaxv2 = ymaxv2';
% yminv2 = yminv2';
% 
% ymin1 = mean(yminv1);
% ymax1 = mean(ymaxv1);
% ymin2 = mean(yminv2);
% ymax2 = mean(ymaxv2);
% 
% 
% figure(2)
% point1=[xmin ymin1 zmax];
% point2=[xmax ymin2 zmin];
% point3=[xmax ymax2 zmin];
% point4=[xmin ymax1 zmax];
% plot3([point1(:,1),point2(:,1)],[point1(:,2),point2(:,2)],[point1(:,3),point2(:,3)]);
% hold on;
% plot3([point3(:,1),point4(:,1)],[point3(:,2),point4(:,2)],[point3(:,3),point4(:,3)]);
% hold on
% plot3(new1(:,1),new1(:,2),new1(:,3),'r.');

% road1(:,1)=new1(:,1);
% road1(:,2)=new1(:,2);
% road1(:,3)=new1(:,3);
% road2 = mean(road,1);
% centeredPlane=bsxfun(@minus,road1,road2);
% [U,S,V]=svd(centeredPlane);
% 
% a=V(1,3);
% b=V(2,3);
% c=V(3,3);
% d=-dot([a b c],road2);
% 
% figure(2)
% scatter3(new1(:,1),new1(:,2),new1(:,3),'r.')
% hold on
% xfit = min(new1(:,1)):0.1:max(new1(:,1));
% yfit = min(new1(:,2)):0.1:max(new1(:,2));
% [XFIT,YFIT]= meshgrid (xfit,yfit);
% ZFIT = -(d + a * XFIT + b * YFIT)/c;
% mesh(XFIT,YFIT,ZFIT);
x = new1(:,1);
y = new1(:,2);
z = new1(:,3);
% p = polyfit(new1(:,1), new1(:,2),2)
% q = polyfit(new1(:,1), new1(:,3),2)
ymin = -0.04676 * xmin + 0.08144;
zmin = -0.05434 * xmin - 1.807;
%plot3(xmin,ymin,zmin,'b.');
hold on;
ymax = -0.04676 * xmax + 0.08144;
zmax = -0.05434 * xmax - 1.807;
plot3([xmin,xmax],[ymin,ymax],[zmin,zmax],'-b.');
hold on;
xl = [xmin,xmax];
yl = [ymin,ymax];
zl = [zmin,zmax];

new1 = sortrows(new1,2);
yminv = new1(:,2);
yminv = yminv';
ymaxv = yminv(:,3290:3540);
yminv = yminv(:,1:250);
ymaxv = ymaxv';
yminv = yminv';
ymin1 = mean(yminv);
ymax1 = mean(ymaxv);
zmin1 = 0.06152 * ymin1 - 1.794;
zmax1 = 0.06152 * ymax1 - 1.794;
xmin1 = -(b/a) * ymin1 - (c/a) * zmin1 - (d/a);
xmax1 = -(b/a) * ymax1 - (c/a) * zmax1 - (d/a);

v1 = xmax - xmin;
v2 = ymax - ymin;
v3 = zmax - zmin;

xmax11 = xmax1 - v1;
xmin11 = xmin1 + v1;
ymax11 = ymax1 - v2;
ymin11 = ymin1 + v2;
zmax11 = zmax1 - v3;
zmin11 = zmin1 + v3;
plot3([xmax11,xmax1],[ymax11,ymax1],[zmax11,zmax1],'-bo');
hold on;
plot3([xmin11,xmin1],[ymin11,ymin1],[zmin11,zmin1],'-bo');
hold on;
xlabel('X');
ylabel('Y');
zlabel('Z');