
clc
close all
clear

L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5;

px = 20;
py = 0;
pz = 0;

% orientation
cw24 = -1;
sw24 = 0;


%theta1
theta1 = atan2(py,px);
if theta1<-pi/2
    theta1 = theta1 + pi;
elseif theta1>pi/2
    theta1 = theta1 - pi;
end

cw1 = cos(theta1);
sw1 = sin(theta1);

ax=-cw1*sw24;
ay=-sw1*sw24;
az=cw24;

%costheta3
D=(((pz-az*(L4+L5)-L1)^2+(px-ax*(L4+L5))^2+(py-ay*(L4+L5))^2)-L2^2-L3^2)/(2*L2*L3);

%theta3
theta3=atan2(sqrt(1-D^2),D);

%theta2
a = L2 + L3*D;
d = L3*sqrt(1-D^2);
K = cos(theta1)*px + sin(theta1)*py + sw24*(L4+L5);

theta2 = [0;0];

theta2(1) = atan2(a,d) - atan2(K,sqrt(a^2+d^2-K^2));
theta2(2) = atan2(a,d) - atan2(K,-sqrt(a^2+d^2-K^2));

%theta4
theta234 = atan2(sw24,cw24);
if theta234<0
    theta234 = theta234+2*pi;
end

theta4 = [0;0];
theta4(1) = theta234 - theta2(1) - theta3;
theta4(2) = theta234 - theta2(2) - theta3;

%output thetas
theta1;
theta1*180/pi
theta2;
theta2*180/pi
theta3;
theta3*180/pi
theta4;
theta4*180/pi