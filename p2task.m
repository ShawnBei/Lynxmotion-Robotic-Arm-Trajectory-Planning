clear
close all
clc







% change alph here
alph = 40;
% change end-effcetor position here
xc = 50;
yc = 20;









figure (1)
set(1,'position',[1000 0 560 420])

figure (2)
set(2,'position',[200 0 560 420])

% parameters of links
ra = 170;
L = 130;
rplat = 130;
rbase = 290;

alpha = alph*pi/180;

thetaPB = [pi+pi/6 pi/2 2*pi-pi/6];
xpb = [-rbase/2*sqrt(3) 0 rbase/2*sqrt(3)];
ypb = [-rbase/2 rbase -rbase/2];

xpbpp = xc + rplat * cos(alpha + thetaPB) - rbase * cos(thetaPB);
ypbpp = yc + rplat * sin(alpha + thetaPB) - rbase * sin(thetaPB);

e1 = -2 * ypbpp *ra;
e2 = -2 * xpbpp * ra;
e3 = xpbpp.^2 + ypbpp.^2 + ra^2 - L^2;

t1 = (-e1 + sqrt(e1.^2 + e2.^2 - e3.^2))./(e3 - e2);
t2 = (-e1 - sqrt(e1.^2 + e2.^2 - e3.^2))./(e3 - e2);

theta1 = 2*atan(t1);
theta2 = 2*atan(t2);

cosphi1 = xc + rplat * cos(alpha + thetaPB) - rbase * cos(thetaPB) - ra * cos(theta1);
cosphi2 = xc + rplat * cos(alpha + thetaPB) - rbase * cos(thetaPB) - ra * cos(theta2);

sinphi1 = yc + rplat * sin(alpha + thetaPB) - rbase * sin(thetaPB) - ra * sin(theta1);
sinphi2 = yc + rplat * sin(alpha + thetaPB) - rbase * sin(thetaPB) - ra * sin(theta2);

phi1 = atan2(sinphi1,cosphi1);
phi2 = atan2(sinphi2,cosphi2);

%% plot robot
figure (1)
plot([-rbase/2*sqrt(3) 0],[-rbase/2 rbase],'b')
hold on
plot([0 rbase/2*sqrt(3)],[rbase -rbase/2],'b')
hold on
plot([rbase/2*sqrt(3) -rbase/2*sqrt(3)],[-rbase/2 -rbase/2],'b')
hold on
grid on

xM = ra * cos(theta1) + xpb;
yM = ra * sin(theta1) + ypb;

xpp = ra * cos(theta1) + L * cos(phi1) + xpb;
ypp = ra * sin(theta1) + L * sin(phi1) + ypb;

for i = 1:3
    plot([xpb(i) xM(i)],[ypb(i) yM(i)],'-og')
    hold on
end

for i = 1:3
    plot([xM(i) xpp(i)],[yM(i) ypp(i)],'-ob')
    hold on
end

plot([xpp(1) xpp(2)],[ypp(1) ypp(2)],'-or')
hold on
plot([xpp(2) xpp(3)],[ypp(2) ypp(3)],'-or')
hold on
plot([xpp(3) xpp(1)],[ypp(3) ypp(1)],'-or')
hold on
axis([-400 400 -300 350])
hold on

text(xpb(1) - 20, ypb(1) - 20, 'PB1') ;
text(xpb(3) + 10, ypb(3) - 10, 'PB3') ;
text(xpb(2), ypb(2) + 20, 'PB2') ;

text(xpp(1) - 20, ypp(1) - 20, 'PP1') ;
text(xpp(2) - 20, ypp(2) - 20, 'PP2') ;
text(xpp(3) - 20, ypp(3) - 20, 'PP3') ;

xlabel('x/mm'); 
ylabel('y/mm');
s = strcat('alph =', {' '}, int2str(alph),' xc =', {' '}, int2str(xc),' yc =', {' '}, int2str(yc));
title(s)

%% plot robot
figure (2)
plot([-rbase/2*sqrt(3) 0],[-rbase/2 rbase],'b')
hold on
plot([0 rbase/2*sqrt(3)],[rbase -rbase/2],'b')
hold on
plot([rbase/2*sqrt(3) -rbase/2*sqrt(3)],[-rbase/2 -rbase/2],'b')
hold on
grid on

xM = ra * cos(theta2) + xpb;
yM = ra * sin(theta2) + ypb;

xpp = ra * cos(theta2) + L * cos(phi2) + xpb;
ypp = ra * sin(theta2) + L * sin(phi2) + ypb;

for i = 1:3
    plot([xpb(i) xM(i)],[ypb(i) yM(i)],'-og')
    hold on
end

for i = 1:3
    plot([xM(i) xpp(i)],[yM(i) ypp(i)],'-ob')
    hold on
end

plot([xpp(1) xpp(2)],[ypp(1) ypp(2)],'-or')
hold on
plot([xpp(2) xpp(3)],[ypp(2) ypp(3)],'-or')
hold on
plot([xpp(3) xpp(1)],[ypp(3) ypp(1)],'-or')
hold on
axis([-400 400 -300 350])
hold on

text(xpb(1) - 20, ypb(1) - 20, 'PB1') ;
text(xpb(3) + 10, ypb(3) - 10, 'PB3') ;
text(xpb(2), ypb(2) + 20, 'PB2') ;

text(xpp(1) - 20, ypp(1) - 20, 'PP1') ;
text(xpp(2) - 20, ypp(2) - 20, 'PP2') ;
text(xpp(3) - 20, ypp(3) - 20, 'PP3') ;

xlabel('x/mm'); 
ylabel('y/mm');

title(s)
