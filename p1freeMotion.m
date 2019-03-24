
% free motion from (-15,5,0) to (-5,10,0), time is 3 sec

clc
close all
clear 

figure (1)
set(1,'position',[0 0 800 600])

L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5; 

tf = 3; % 
d = 0.2; % 

px = zeros(1, tf/d+1);
py = zeros(1, tf/d+1);
pz = zeros(1, tf/d+1);

i = 0;

for t = 0:d:tf   % t has 16 different value
    
    i = i + 1;
    
    theta10 = -0.3218; theta20 = 1.8978; theta30 = 1.992; theta40 = -0.7482;
    theta1f = -1.1071; theta2f = 1.6342; theta3f = 2.3277; theta4f = -0.8203;
    
    q1 = theta10 + 3*(theta1f-theta10)/(tf^2)*(t^2) - 2*(theta1f-theta10)/(tf^3)*(t^3);
    q2 = theta20 + 3*(theta2f-theta20)/(tf^2)*(t^2) - 2*(theta2f-theta20)/(tf^3)*(t^3);
    q3 = theta30 + 3*(theta3f-theta30)/(tf^2)*(t^2) - 2*(theta3f-theta30)/(tf^3)*(t^3);
    q4 = theta40 + 3*(theta4f-theta40)/(tf^2)*(t^2) - 2*(theta4f-theta40)/(tf^3)*(t^3);

    %calculate cos and sin
    c1 = cos(q1);
    c2 = cos(q2);
    c3 = cos(q3);
    c4 = cos(q4);

    c23 = cos(q2 + q3);
    c24 = cos(q2 + q3 + q4);

    s1 = sin(q1);
    s2 = sin(q2);
    s3 = sin(q3);
    s4 = sin(q4);

    s23 = sin(q2 + q3);
    s24 = sin(q2 + q3 + q4);

    %calculate joints' position
    x0 = 0;
    x1 = 0;
    x2 = L2 * c2 * c1;
    x3 = x2 + L3 * c23 * c1;
    x4 = x3 - L4 * s24 * c1;
    xe = x4 - L5 * s24 * c1;
    px(i) = xe;

    y0 = 0;
    y1 = 0;
    y2 = L2 * c2 * s1;
    y3 = y2 + L3 * c23 * s1;
    y4 = y3 - L4 * s24 * s1;
    ye = y4 - L5 * s24 * s1;
    py(i) = ye;

    z0 = 0;
    z1 = L1;
    z2 = L1 + L2 * s2;
    z3 = z2 + L3 * s23;
    z4 = z3 + L4 * c24;
    ze = z4 + L5 * c24;
    pz(i) = ze;

    xx0 = [x0 x1 x2 x3 x4 xe];
    yy0 = [y0 y1 y2 y3 y4 ye];
    zz0 = [z0 z1 z2 z3 z4 ze];

    %plot links
    figure(1)
    p = plot3(xx0, yy0, zz0, 'ko-','Linewidth',2);
    xlabel('x/cm'); 
    ylabel('y/cm');
    zlabel('z/cm');
    axis equal
    axis([-25 10 -10 20 0 22])
    hold on
    grid on

    pause(0.2)
    set(p,'visible','off')
    
    %plot points
    plot3(xe, ye, ze, '.')
    axis equal
    axis([-25 10 -10 20 0 22])
    text(-15 - 2, 5 - 2, 0, 'Start') ;
    text(-5 + 2, 10 + 2, 0, 'End') ;
    hold on
    grid on

end

%% plot change of theta w.r.t t
figure (3)
set(3,'position',[500 0 560 420])

t = 0:d:tf;

q1 = ( theta10 + 3*(theta1f-theta10)/(tf^2)*(t.^2) - 2*(theta1f-theta10)/(tf^3)*(t.^3) )*180/pi;
q2 = ( theta20 + 3*(theta2f-theta20)/(tf^2)*(t.^2) - 2*(theta2f-theta20)/(tf^3)*(t.^3) )*180/pi;
q3 = ( theta30 + 3*(theta3f-theta30)/(tf^2)*(t.^2) - 2*(theta3f-theta30)/(tf^3)*(t.^3) )*180/pi;
q4 = ( theta40 + 3*(theta4f-theta40)/(tf^2)*(t.^2) - 2*(theta4f-theta40)/(tf^3)*(t.^3) )*180/pi;

figure (3)
plot(t,q1)
hold on 
plot(t,q2)
hold on
plot(t,q3)
hold on
plot(t,q4)

title('Value of Theta')
ylabel('Value of Angle'); 
xlabel('t/sec');
hold on

grid on

legend('theta1','theta2','theta3','theta4')

%% plot change of velocity of theta wrt t
figure (4)
set(4,'position',[500 0 560 420])

v1 = 6*(theta1f-theta10)/(tf^2)*t - 6*(theta1f-theta10)/(tf^3)*(t.^2);
v2 = 6*(theta2f-theta20)/(tf^2)*t - 6*(theta2f-theta20)/(tf^3)*(t.^2);
v3 = 6*(theta3f-theta30)/(tf^2)*t - 6*(theta3f-theta30)/(tf^3)*(t.^2);
v4 = 6*(theta4f-theta40)/(tf^2)*t - 6*(theta4f-theta40)/(tf^3)*(t.^2);

figure (4)
plot(t,v1)
hold on 
plot(t,v2)
hold on
plot(t,v3)
hold on
plot(t,v4)
title('Velocity of Theta')
ylabel('Velocity / (cm/sec)'); 
xlabel('t/sec');
hold on

grid on

legend('v1','v2','v3','v4')

%% plot acceleration of theta wrt t
figure (5)
set(5,'position',[500 0 560 420])

a1 = 6*(theta1f-theta10)/(tf^2) - 12*(theta1f-theta10)/(tf^3)*t;
a2 = 6*(theta2f-theta20)/(tf^2) - 12*(theta2f-theta20)/(tf^3)*t;
a3 = 6*(theta3f-theta30)/(tf^2) - 12*(theta3f-theta30)/(tf^3)*t;
a4 = 6*(theta4f-theta40)/(tf^2) - 12*(theta4f-theta40)/(tf^3)*t;

figure (5)
plot(t,a1)
hold on 
plot(t,a2)
hold on
plot(t,a3)
hold on
plot(t,a4)
title('Acceleration of Theta')
ylabel('Acceleration / (cm/sec2)'); 
xlabel('t/sec');
hold on

grid on

legend('a1','a2','a3','a4')

%% plot x y z wrt t
figure (6)
set(6,'position',[1000 0 560 420])

p1 = polyfit(t,px,5); 
p2 = polyfit(t,py,5); 
p3 = polyfit(t,pz,5); 
fx = polyval(p1,t); 
fy = polyval(p2,t); 
fz = polyval(p3,t); 

figure (6)
plot(t,px,'o',t,fx,'-') 
hold on
plot(t,py,'o',t,fy,'-') 
hold on
plot(t,pz,'o',t,fz,'-') 
hold on

grid on

title('PolyFit of EE Position')
ylabel('cm'); 
xlabel('t/sec');

legend('px data','px fit','py data','py fit','pz data','pz fit')

sx = sprintf('x = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p1(1),p1(2),p1(3),p1(4),p1(5),p1(6));

sy = sprintf('y = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p2(1),p2(2),p2(3),p2(4),p2(5),p2(6));

sz = sprintf('z = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p3(1),p3(2),p3(3),p3(4),p3(5),p3(6));

text(0.1, -2, sz) ;
text(0.1, 10, sy) ;
text(0.1, -15, sx) ;

%% velocity of ee
figure (7)
set(7,'position',[1000 0 560 420])

vx = 5 * p1(1) * (t.^4) + 4 * p1(2) * (t.^3) + 3 * p1(3) * (t.^2) + 2 * p1(4) * t + p1(5);
vy = 5 * p2(1) * (t.^4) + 4 * p2(2) * (t.^3) + 3 * p2(3) * (t.^2) + 2 * p2(4) * t + p2(5);
vz = 5 * p3(1) * (t.^4) + 4 * p3(2) * (t.^3) + 3 * p3(3) * (t.^2) + 2 * p3(4) * t + p3(5);

figure (7)
plot(t,vx,'-') 
hold on
plot(t,vy,'-') 
hold on
plot(t,vz,'-') 
hold on

grid on

title('Velocity of EE')
ylabel('Velocity / (cm/sec)'); 
xlabel('t/sec');

legend('velocity of x','velocity of y','velocity of z')

%% acceleration of ee
figure (8)
set(8,'position',[1000 0 560 420])

ax = 20 * p1(1) * (t.^3) + 12 * p1(2) * (t.^2) + 6 * p1(3) * t + 2 * p1(4);
ay = 20 * p2(1) * (t.^3) + 12 * p2(2) * (t.^2) + 6 * p2(3) * t + 2 * p2(4);
az = 20 * p3(1) * (t.^3) + 12 * p3(2) * (t.^2) + 6 * p3(3) * t + 2 * p3(4);

figure (8)
plot(t,ax,'-') 
hold on
plot(t,ay,'-') 
hold on
plot(t,az,'-') 
hold on

grid on

title('Acceleration of EE')
ylabel('Acceleration / (cm/sec2)'); 
xlabel('t/sec');

legend('acceleration of x','acceleration of y','acceleration of z')


