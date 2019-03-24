
% straight line from (-15,5,0) to (-5,10,0), time is 3 sec

clc
close all
clear 

figure (1)
set(1,'position',[0 0 800 600])

L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5; 

tf = 3; % 
d = 0.2; % 

theta1i = zeros(1, tf/d+1);
theta2i = zeros(1, tf/d+1);
theta3i = zeros(1, tf/d+1);
theta4i = zeros(1, tf/d+1);

i = 0;

for t = 0:d:tf   % t has tf/d+1 different value
    
    i = i + 1;
    
    xi = -15;
    xf = -5; 
    
    px = xi + 3*(xf-xi)/(tf^2)*(t^2) - 2*(xf-xi)/(tf^3)*(t^3);
    py = 0.5*px + 12.5;
    pz = 0;
    
    %% calculate IK for angles
    
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
    m = L3*sqrt(1-D^2);
    K = cos(theta1)*px + sin(theta1)*py + sw24*(L4+L5);

    theta2 = [0;0];

    theta2(1) = atan2(a,m) - atan2(K,sqrt(a^2+m^2-K^2));
    theta2(2) = atan2(a,m) - atan2(K,-sqrt(a^2+m^2-K^2));

    %theta4
    theta234 = atan2(sw24,cw24);
    if theta234<0
        theta234 = theta234+2*pi;
    end

    theta4 = [0;0];
    theta4(1) = theta234 - theta2(1) - theta3;
    theta4(2) = theta234 - theta2(2) - theta3;

    q1 = theta1;
    q2 = theta2(1);
    q3 = theta3;
    q4 = theta4(1);
    
    theta1i(i) = q1*180/pi;
    theta2i(i) = q2*180/pi;
    theta3i(i) = q3*180/pi;
    theta4i(i) = q4*180/pi;
    
    %calculate cos and sin
    c1 = cos(q1);
    c2 = cos(q2);
    c3 = cos(q3);
    c4 = cos(q4);

    c23 = cos(q2 + q3);
    c24 = cos(q2 + q3 + q4);

    s1 = sin(q1);
    s2 = sin(q2);

    s23 = sin(q2 + q3);
    s24 = sin(q2 + q3 + q4);

    %calculate joints' position
    x0 = 0;
    x1 = 0;
    x2 = L2 * c2 * c1;
    x3 = x2 + L3 * c23 * c1;
    x4 = x3 - L4 * s24 * c1;
    xe = x4 - L5 * s24 * c1;

    y0 = 0;
    y1 = 0;
    y2 = L2 * c2 * s1;
    y3 = y2 + L3 * c23 * s1;
    y4 = y3 - L4 * s24 * s1;
    ye = y4 - L5 * s24 * s1;

    z0 = 0;
    z1 = L1;
    z2 = L1 + L2 * s2;
    z3 = z2 + L3 * s23;
    z4 = z3 + L4 * c24;
    ze = z4 + L5 * c24;

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

%% plot value of (x y z) w.r.t of t
figure (3)
set(3,'position',[500 0 560 420])

t = 0:d:tf;

px = xi + 3*(xf-xi)/(tf^2)*(t.^2) - 2*(xf-xi)/(tf^3)*(t.^3);
py = 0.5*px + 12.5;
pz = 0*t;

figure (3)
plot(t,px)
hold on
plot(t,py)
hold on
plot(t,pz)
hold on
grid on

title('Value of x y z')
xlabel('Value of x y z'); 
ylabel('t/sec');

legend('px','py','pz')

%% plot velocity of (x y z) wrt of t
figure (4)
set(4,'position',[500 0 560 420])

vx = 6*(xf-xi)/(tf^2)*t - 6*(xf-xi)/(tf^3)*(t.^2);
vy = 0.5*vx;
vz = 0*t;
figure (4)
plot(t,vx)
hold on 
plot(t,vy)
hold on
plot(t,vz)
hold on
title('Velocity of End-effector')
xlabel('Velocity / (cm/sec)'); 
ylabel('t/sec');

grid on

legend('vx','vy','vz')

%% plot acceleration of (x y z) wrt t
figure (5)
set(5,'position',[500 0 560 420])

ax = 6*(xf-xi)/(tf^2) - 12*(xf-xi)/(tf^3)*t;
ay = 0.5*ax;
az = 0*t;

figure (5)
plot(t,ax)
hold on 
plot(t,ay)
hold on
plot(t,az)
hold on
title('Acceleration of End-Effector')
xlabel('Acceleration / (cm/sec2)'); 
ylabel('t/sec');

grid on

legend('ax','ay','az')

%% plot thetas wrt t
figure (6)
set(6,'position',[1000 0 560 420])

p1 = polyfit(t,theta1i,5); 
p2 = polyfit(t,theta2i,5); 
p3 = polyfit(t,theta3i,5); 
p4 = polyfit(t,theta4i,5);
f1 = polyval(p1,t); 
f2 = polyval(p2,t); 
f3 = polyval(p3,t); 
f4 = polyval(p4,t); 

figure (6)
plot(t,theta1i,'o',t,f1,'-') 
hold on
plot(t,theta2i,'o',t,f2,'-') 
hold on
plot(t,theta3i,'o',t,f3,'-') 
hold on
plot(t,theta4i,'o',t,f4,'-') 
hold on
legend('theta1 data','theta1 fit','theta2 data','theta2 fit','theta3 data','theta3 fit','theta4 data','theta4 fit')

grid on

s1 = sprintf('theta1 = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p1(1),p1(2),p1(3),p1(4),p1(5),p1(6));
text(0.1, -10, s1) ;
s2 = sprintf('theta2 = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p2(1),p2(2),p2(3),p2(4),p2(5),p2(6));
text(0.1, 80, s2);
s3 = sprintf('theta3 = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p3(1),p3(2),p3(3),p3(4),p3(5),p3(6));
text(0.1, 140, s3);
s4 = sprintf('theta4 = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p4(1),p4(2),p4(3),p4(4),p4(5),p4(6));
text(0.1, -70, s4);

title('PolyFit of Angles')
ylabel('(o)'); 
xlabel('t/sec');

%% velocity of angles
figure (7)
set(7,'position',[1000 0 560 420])

vtheta1 = 5 * p1(1) * (t.^4) + 4 * p1(2) * (t.^3) + 3 * p1(3) * (t.^2) + 2 * p1(4) * t + p1(5);
vtheta2 = 5 * p2(1) * (t.^4) + 4 * p2(2) * (t.^3) + 3 * p2(3) * (t.^2) + 2 * p2(4) * t + p2(5);
vtheta3 = 5 * p3(1) * (t.^4) + 4 * p3(2) * (t.^3) + 3 * p3(3) * (t.^2) + 2 * p3(4) * t + p3(5);
vtheta4 = 5 * p4(1) * (t.^4) + 4 * p4(2) * (t.^3) + 3 * p4(3) * (t.^2) + 2 * p4(4) * t + p4(5);

figure (7)
plot(t,vtheta1,'-') 
hold on
plot(t,vtheta2,'-') 
hold on
plot(t,vtheta3,'-') 
hold on
plot(t,vtheta4,'-') 
hold on

grid on

title('Velocity of Joints')
ylabel('Velocity / ((o)/sec)'); 
xlabel('t/sec');

legend('velocity of theta1','velocity of theta2','velocity of theta3','velocity of theta4')

%% acceleration of angles
figure (8)
set(8,'position',[1000 0 560 420])

atheta1 = 20 * p1(1) * (t.^3) + 12 * p1(2) * (t.^2) + 6 * p1(3) * t + 2 * p1(4);
atheta2 = 20 * p2(1) * (t.^3) + 12 * p2(2) * (t.^2) + 6 * p2(3) * t + 2 * p2(4);
atheta3 = 20 * p3(1) * (t.^3) + 12 * p3(2) * (t.^2) + 6 * p3(3) * t + 2 * p3(4);
atheta4 = 20 * p4(1) * (t.^3) + 12 * p4(2) * (t.^2) + 6 * p4(3) * t + 2 * p4(4);

figure (8)
plot(t,atheta1,'-') 
hold on
plot(t,atheta2,'-') 
hold on
plot(t,atheta3,'-') 
hold on
plot(t,atheta4,'-') 
hold on

grid on

title('Acceleration of Joints')
ylabel('Acceleration / ((o)/sec2)'); 
xlabel('t/sec');

legend('acceleration of theta1','acceleration of theta2','acceleration of theta3','acceleration of theta4')


