clear
close all
clc

% parameters of links
L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5;

figure (1)
set(1,'position',[0 0 800 600])

plotcube([8*sqrt(3)-12 8*sqrt(3)-12 8*sqrt(3)-12],[-4-4*sqrt(3)  11-4*sqrt(3)  0],1,[0.5 0.5 0.5]);
axis equal
axis([-25 20 -10 20 0 30])
grid on
hold on

% time interval is 0.2s
td = 0.2;

% acceleration time = 0.5s
tf = 0.5;

% constant time = 3.5s
tc = 3.5;

% acceleration = 5 cm/s^2
a = 5;

% constant velocity = 2.5 cm/s
v = 2.5;

%% top line
for t = 0:td:tf
    
    % position
    py = 15;
    px = a*t^2/2 - 15;
    pz = 0;
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = 15;
    px = v*t - 14.375;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = 15;
    px = v*t - a*t^2/2 - 5.625;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

%% right line
for t = 0:td:tf
    
    % position
    py = -a*t^2/2 + 15;
    px = -5;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = -v*t + 14.375;
    px = -5;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = -v*t + a*t^2/2 + 5.625;
    px = -5;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

%% bottom line
% q = [-33.6901, 85.2612, 141.6180, -46.8793, 0];
q = [];
xset = [];
yset = [];
zset = [];

for t = 0:td:tf
    
    % position
    py = 5;
    px = -a*t^2/2 - 5;
    pz = 0;
    
   
    drawLineWithOb(px,py,pz);
end

for t = 0:td:((2.5-0.625)/v)
    
    % position
    py = 5;
    px = -v*t - 5.625;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0.1:td:(sqrt(3)*pi/6/v)
    
    r = sqrt(3)/2;
    w = v/r;
    
    theta = -0.5*pi - w*t;
    
    px = r*cos(theta) - 7.5;
    py = 5;
    pz = r*sin(theta) + sqrt(3)/2;
    
    b = inTheAir(px,py,pz);
    
    q = [q;b];
    xset = [xset, px];
    yset = [yset, py];
    zset = [zset, pz];
end

for t = 0.1:td:((12.5-6*sqrt(3))/v)
    
    % position
    px = -0.5*v*t - 8.25;
    py = 5;
    pz = -2*px + sqrt(3)/4 - 16.5;
    
    b = inTheAir(px,py,pz);
    
    q = [q;b];
    xset = [xset, px];
    yset = [yset, py];
    zset = [zset, pz];
end


for t = 0.15:td:((12 - 6*sqrt(3))*pi/3/v)
    
    r = 6 - 3*sqrt(3);
    w = v/r;
    
    theta = 1/6*pi + w*t;
    
    px = r*cos(theta) - 10;
    py = 5;
    pz = r*sin(theta) + 8*sqrt(3) -12;
    
    b = inTheAir(px,py,pz);
    
    q = [q;b];
    xset = [xset, px];
    yset = [yset, py];
    zset = [zset, pz];
end


for t = 0.1:td:((12.5-6*sqrt(3))/v)
    
    % position
    px = -0.5*v*t - 5.5-3*sqrt(3);
    py = 5;
    pz = 2*px + 12.5*sqrt(3) + 2;
    
    b = inTheAir(px,py,pz);
    
    q = [q;b];
    xset = [xset, px];
    yset = [yset, py];
    zset = [zset, pz];
end

for t = 0.1:td:(sqrt(3)*pi/6/v)
    
    r = sqrt(3)/2;
    w = v/r;
    
    theta = -1/6*pi - w*t;
    
    px = r*cos(theta) - 12.5;
    py = 5;
    pz = r*sin(theta) + sqrt(3)/2;
    
    b = inTheAir(px,py,pz);
    
    q = [q;b];
    xset = [xset, px];
    yset = [yset, py];
    zset = [zset, pz];
end

for t = 0.1:td:((2.5-0.625)/v)
    
    % position
    py = 5;
    px = -v*t - 12.5;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = 5;
    px = -v*t + a*t^2/2 - 14.375;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end


%% left line
for t = 0:td:tf
    
    % position
    py = a*t^2/2 + 5;
    px = -15;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = v*t + 5.625;
    px = -15;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = v*t - a*t^2/2 + 14.375;
    px = -15;
    pz = 0;
    
    drawLineWithOb(px,py,pz);
end

%% plot value of EE
figure (3)
set(3,'position',[500 0 560 420])

t = 0 : td : (2*((sqrt(3)*pi/6/v) + (12.5-6*sqrt(3))/v) + (12 - 6*sqrt(3))*pi/3/v)-0.1;

o1 = polyfit(t,xset,2); 
o2 = polyfit(t,yset,3); 
o3 = polyfit(t,zset,5); 
r1 = polyval(o1,t); 
r2 = polyval(o2,t); 
r3 = polyval(o3,t); 

figure (3)
plot(t,xset,'or',t,r1,'-r') 
hold on
plot(t,yset,'og',t,r2,'-g') 
hold on
plot(t,zset,'ob',t,r3,'-b') 
hold on

grid on

title('PolyFit of EE')
ylabel('cm'); 
xlabel('t/sec');

legend('x data','x fit','y data','y fit','z data','z fit')

s1 = sprintf('x = (%f) t^2 + (%f) t + (%f)',o1(1),o1(2),o1(3));
s2 = sprintf('y = (%f) t^3 + (%f) t^2 + (%f) t + (%f)',o2(1),o2(2),o2(3),o2(4));
s3 = sprintf('z = (%f) t^5 + (%f) t^4 + (%f) t^3 + (%f) t^2 + (%f) t + (%f)',o3(1),o3(2),o3(3),o3(4),o3(5),o3(6));

text(1, -8, s1) ;
text(0.1, 4, s2) ;
text(0, -1, s3) ;

%% plot velocity of EE
figure (4)
set(4,'position',[500 0 560 420])

vx = 2 * o1(1) * t + o1(2);
vy = 3 * o2(1) * (t.^2) + 2 * o2(2) * t + o2(3);
vz = 5 * o3(1) * (t.^4) + 4 * o3(2) * (t.^3) + 3 * o3(3) * (t.^2) + 2 * o3(4) * t + o3(5);

figure (4)
plot(t,vx,'-r') 
hold on
plot(t,vy,'-g') 
hold on
plot(t,vz,'-b') 
hold on

grid on

title('Velocity of EE')
ylabel('Velocity / ((o)/sec)'); 
xlabel('t/sec');

legend('velocity of x','velocity of y','velocity of z')

%% acceleration of EE
figure (5)
set(5,'position',[500 0 560 420])

ax = 2 * o1(1) + 0*t;
ay = 6 * o2(1) * t + 2 * o2(2);
az = 20 * o3(1) * (t.^3) + 12 * o3(2) * (t.^2) + 6 * o3(3) * t + 2 * o3(4);

figure (5)
plot(t,ax,'-r') 
hold on
plot(t,ay,'-g') 
hold on
plot(t,az,'-b') 
hold on

grid on

title('Acceleration of EE')
ylabel('Acceleration / ((o)/sec2)'); 
xlabel('t/sec');

legend('acceleration of x','acceleration of y','acceleration of z')

%% plot value of angles 
figure (6)
set(6,'position',[1000 0 560 420])

p1 = polyfit(t,q(:,1)',3); 
p2 = polyfit(t,q(:,2)',3); 
p3 = polyfit(t,q(:,3)',3); 
p4 = polyfit(t,q(:,4)',3); 
p5 = polyfit(t,q(:,5)',3); 
f1 = polyval(p1,t); 
f2 = polyval(p2,t); 
f3 = polyval(p3,t); 
f4 = polyval(p4,t);
f5 = polyval(p5,t);

figure (6)
plot(t,q(:,1)','or',t,f1,'-r') 
hold on
plot(t,q(:,2)','og',t,f2,'-g') 
hold on
plot(t,q(:,3)','ob',t,f3,'-b') 
hold on
plot(t,q(:,4),'ok',t,f4,'-k') 
hold on
plot(t,q(:,5)','oy',t,f5,'-y') 
hold on

grid on

title('PolyFit of Joint Motion')
ylabel('Degree'); 
xlabel('t/sec');

legend('theta1 data','theta1 fit','theta2 data','theta2 fit','theta3 data','theta3 fit','theta4 data','theta4 fit','theta5 data','theta5 fit')

s1 = sprintf('theta1 = (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p1(1),p1(2),p1(3),p1(4));
s2 = sprintf('theta2 = (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p2(1),p2(2),p2(3),p2(4));
s3 = sprintf('theta3 = (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p3(1),p3(2),p3(3),p3(4));
s4 = sprintf('theta4 = (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p4(1),p4(2),p4(3),p4(4));
s5 = sprintf('theta5 = (%f) t^3 + (%f) t^2 + (%f) t + (%f)',p5(1),p5(2),p5(3),p5(4));

text(0.1, 120, s3) ;
text(0.1, 75, s2) ;
text(0.1, 10, s5) ;
text(0.1, -15, s1) ;
text(0.5, -45, s4) ;

%% velocity of angles
figure (7)
set(7,'position',[1000 0 560 420])

vtheta1 = 3 * p1(1) * (t.^2) + 2 * p1(2) * t + p1(3);
vtheta2 = 3 * p2(1) * (t.^2) + 2 * p2(2) * t + p2(3);
vtheta3 = 3 * p3(1) * (t.^2) + 2 * p3(2) * t + p3(3);
vtheta4 = 3 * p4(1) * (t.^2) + 2 * p4(2) * t + p4(3);
vtheta5 = 3 * p5(1) * (t.^2) + 2 * p5(2) * t + p5(3);

figure (7)
plot(t,vtheta1,'-') 
hold on
plot(t,vtheta2,'-') 
hold on
plot(t,vtheta3,'-') 
hold on
plot(t,vtheta4,'-') 
hold on
plot(t,vtheta5,'-') 
hold on

grid on

title('Velocity of Joints')
ylabel('Velocity / ((o)/sec)'); 
xlabel('t/sec');

legend('velocity of theta1','velocity of theta2','velocity of theta3','velocity of theta4','velocity of theta5')

%% acceleration of angles
figure (8)
set(8,'position',[1000 0 560 420])

atheta1 = 6 * p1(1) * t + 2 * p1(2);
atheta2 = 6 * p2(1) * t + 2 * p2(2);
atheta3 = 6 * p3(1) * t + 2 * p3(2);
atheta4 = 6 * p4(1) * t + 2 * p4(2);
atheta5 = 6 * p5(1) * t + 2 * p5(2);

figure (8)
plot(t,atheta1,'-') 
hold on
plot(t,atheta2,'-') 
hold on
plot(t,atheta3,'-') 
hold on
plot(t,atheta4,'-') 
hold on
plot(t,atheta5,'-') 
hold on

grid on

title('Acceleration of Joints')
ylabel('Acceleration / ((o)/sec2)'); 
xlabel('t/sec');

legend('acceleration of theta1','acceleration of theta2','acceleration of theta3','acceleration of theta4','acceleration of theta5')






