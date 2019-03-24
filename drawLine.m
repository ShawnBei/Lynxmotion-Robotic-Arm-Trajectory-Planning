function drawLine(px, py, pz)

    L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5; 
    
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
%     theta1*180/pi;
%     theta2*180/pi;
%     theta3*180/pi;
%     theta4*180/pi;

    q1 = theta1;
    q2 = theta2(1);
    q3 = theta3;
    q4 = theta4(1);

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

    pause(0.1)
    set(p,'visible','off')
    
    %plot points
    plot3(xe,ye,ze, '.k')
    axis equal
    axis([-25 10 -10 20 0 22])
    text(-15 - 2, 15 + 1, 0, 'Start') ;
    hold on
    grid on
end