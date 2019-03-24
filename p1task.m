clear
close all
clc

% parameters of links
L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5; 

figure (1)
set(1,'position',[0 0 800 600])

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
   drawLine(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = 15;
    px = v*t - 14.375;
    pz = 0;

   drawLine(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = 15;
    px = v*t - a*t^2/2 - 5.625;
    pz = 0;

   drawLine(px,py,pz);
end

%% right line
for t = 0:td:tf
    
    % position
    py = -a*t^2/2 + 15;
    px = -5;
    pz = 0;

   drawLine(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = -v*t + 14.375;
    px = -5;
    pz = 0;

   drawLine(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = -v*t + a*t^2/2 + 5.625;
    px = -5;
    pz = 0;

   drawLine(px,py,pz);
end

%% bottom line
for t = 0:td:tf
    
    % position
    py = 5;
    px = -a*t^2/2 - 5;
    pz = 0;
   drawLine(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = 5;
    px = -v*t - 5.625;
    pz = 0;

   drawLine(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = 5;
    px = -v*t + a*t^2/2 - 14.375;
    pz = 0;

   drawLine(px,py,pz);
end


%% left line
for t = 0:td:tf
    
    % position
    py = a*t^2/2 + 5;
    px = -15;
    pz = 0;

   drawLine(px,py,pz);
end

for t = 0:td:tc
    
    % position
    py = v*t + 5.625;
    px = -15;
    pz = 0;

   drawLine(px,py,pz);
end

for t = 0:td:tf
    
    % position
    py = v*t - a*t^2/2 + 14.375;
    px = -15;
    pz = 0;

   drawLine(px,py,pz);
end

figure(1)
plot3(-15, 15, 0, 'or')
hold on
text(-15, 15 + 2, 0, '1') ;

plot3(-15, 5, 0, 'or')
hold on
text(-5 + 1, 15 + 1, 0, '2') ;

plot3(-5, 15, 0, 'or')
hold on
text(-5 + 1, 10, 0, '3') ;

plot3(-5, 5, 0, 'or')
hold on
text(-5 + 1, 5 - 1, 0, '4') ;

plot3(-5, 10, 0, 'or')
hold on
text(-7.5, 5 - 1, 0, '5') ;

plot3(-7.5, 5, 0, 'or')
hold on
text(-12.5, 5 - 1, 0, '6') ;

plot3(-12.5, 5, 0, 'or')
hold on
text(-15 - 1, 5 - 1, 0, '7') ;


