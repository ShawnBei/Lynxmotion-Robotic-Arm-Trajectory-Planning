%% workspace
clc
close all
clear

figure (1)
set(1,'position',[100 200 1000 800])
figure (2)
set(2,'position',[100 200 1000 800])
figure (3)
set(3,'position',[100 200 1000 800])
figure (4)
set(4,'position',[100 200 1000 800])
figure (5)
set(5,'position',[100 200 1000 800])

L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5;

%% theta1 = 0
[q1,q2,q3,q4] = ndgrid(0:10, 0:5*pi/180:pi, 0:5*pi/180:160*pi/180, 0:-5*pi/180:-pi);

cw1 = cos(q1);
sw1 = sin(q1);
cw2 = cos(q2);
sw2 = sin(q2);
cw23= cos(q2+ q3);
sw23= sin(q2+ q3);
cw24= cos(q2+ q3+ q4);
sw24= sin(q2+ q3+ q4);

xwork = (L2.*cw2 + L3.*cw23 - (L4+L5).*sw24).* cw1;
ywork = (L2.*cw2 + L3.*cw23 - (L4+L5)*sw24).* sw1;
zwork = L1 + L2.*sw2 + L3.*sw23 + (L4+L5).*cw24;

figure (1)
plot3(xwork(:),ywork(:),zwork(:),'.')
axis equal
axis([-45 45 -45 45 0 50])

xlabel('x');
ylabel('y');
zlabel('z');

grid on
hold on

%% theta2 = 30

[q1,q2,q3,q4] = ndgrid(-pi/2:5*pi/180:pi/2, 30*pi/180, 0:5*pi/180:160*pi/180, 0:-5*pi/180:-pi);

cw1 = cos(q1);
sw1 = sin(q1);
cw2 = cos(q2);
sw2 = sin(q2);
cw23= cos(q2+ q3);
sw23= sin(q2+ q3);
cw24= cos(q2+ q3+ q4);
sw24= sin(q2+ q3+ q4);

xwork = (L2.*cw2 + L3.*cw23 - (L4+L5).*sw24).* cw1;
ywork = (L2.*cw2 + L3.*cw23 - (L4+L5)*sw24).* sw1;
zwork = L1 + L2.*sw2 + L3.*sw23 + (L4+L5).*cw24;

figure (2)
plot3(xwork(:),ywork(:),zwork(:),'.')
axis equal
axis([-45 45 -45 45 0 50])

xlabel('x');
ylabel('y');
zlabel('z');

grid on
hold on

%% theta3 = 120

[q1,q2,q3,q4] = ndgrid(-pi/2:5*pi/180:pi/2, 0:5*pi/180:pi, 120*pi/180, 0:-5*pi/180:-pi);

cw1 = cos(q1);
sw1 = sin(q1);
cw2 = cos(q2);
sw2 = sin(q2);
cw23= cos(q2+ q3);
sw23= sin(q2+ q3);
cw24= cos(q2+ q3+ q4);
sw24= sin(q2+ q3+ q4);

xwork = (L2.*cw2 + L3.*cw23 - (L4+L5).*sw24).* cw1;
ywork = (L2.*cw2 + L3.*cw23 - (L4+L5)*sw24).* sw1;
zwork = L1 + L2.*sw2 + L3.*sw23 + (L4+L5).*cw24;

figure (3)
plot3(xwork(:),ywork(:),zwork(:),'.')
axis equal
axis([-45 45 -45 45 0 50])

xlabel('x');
ylabel('y');
zlabel('z');

grid on
hold on

%% theta4 = -120

[q1,q2,q3,q4] = ndgrid(-pi/2:5*pi/180:pi/2, 0:5*pi/180:pi, 0:5*pi/180:160*pi/180, -120*pi/180);

cw1 = cos(q1);
sw1 = sin(q1);
cw2 = cos(q2);
sw2 = sin(q2);
cw23= cos(q2+ q3);
sw23= sin(q2+ q3);
cw24= cos(q2+ q3+ q4);
sw24= sin(q2+ q3+ q4);

xwork = (L2.*cw2 + L3.*cw23 - (L4+L5).*sw24).* cw1;
ywork = (L2.*cw2 + L3.*cw23 - (L4+L5)*sw24).* sw1;
zwork = L1 + L2.*sw2 + L3.*sw23 + (L4+L5).*cw24;

figure (4)
plot3(xwork(:),ywork(:),zwork(:),'.')
axis equal
axis([-45 45 -45 45 0 50])

xlabel('x');
ylabel('y');
zlabel('z');

grid on
hold on

%% theta5 = 0

[q1,q2,q3,q4] = ndgrid(-pi/2:5*pi/180:pi/2, 0:5*pi/180:pi, 0:5*pi/180:160*pi/180, 0:-5*pi/180:-pi);

cw1 = cos(q1);
sw1 = sin(q1);
cw2 = cos(q2);
sw2 = sin(q2);
cw23= cos(q2+ q3);
sw23= sin(q2+ q3);
cw24= cos(q2+ q3+ q4);
sw24= sin(q2+ q3+ q4);

xwork = (L2.*cw2 + L3.*cw23 - (L4+L5).*sw24).* cw1;
ywork = (L2.*cw2 + L3.*cw23 - (L4+L5)*sw24).* sw1;
zwork = L1 + L2.*sw2 + L3.*sw23 + (L4+L5).*cw24;

figure (5)
plot3(xwork(:),ywork(:),zwork(:),'.')
axis equal
axis([-45 45 -45 45 0 50])

xlabel('x');
ylabel('y');
zlabel('z');

grid on
hold on