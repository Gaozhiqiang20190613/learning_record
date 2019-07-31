
load ptcloud.mat;

    ring = readField(ptcloud,'laser_id')+1; %获取激光点云的环号
    azimuth = single(readField(ptcloud,'horizon_angle'))/100; %获取激光点云的方位角0.00~360.00
    
    xyz = readXYZ(ptcloud); 
   
    xyzard = [xyz,azimuth,single(ring),sqrt(xyz(:,1).^2 + xyz(:,2).^2 + xyz(:,3).^2)]; 
