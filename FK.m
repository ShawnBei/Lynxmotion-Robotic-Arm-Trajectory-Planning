clc
close all
clear

q1 = -0.3218; q2 = 1.8978; q3 = 1.992; q4 = -0.7482; q5 = 0;

L1 = 6; L2 = 15; L3 = 15; L4 = 3.5; L5 = 6.5; 

c1 = cos(q1);
c2 = cos(q2);
c3 = cos(q3);
c4 = cos(q4);
c5 = cos(q5);

c23 = cos(q2 + q3);
c24 = cos(q2 + q3 + q4);

s1 = sin(q1);
s2 = sin(q2);
s3 = sin(q3);
s4 = sin(q4);
s5 = sin(q5);

s23 = sin(q2 + q3);
s24 = sin(q2 + q3 + q4);

nx = -s1 .* s5 + c5 .* c1 .*c24
ny = c1 .* s5 + c5 .* s1 .* c24
nz = c5 .* s24

ox = -s1 .* c5 - s5 .* c1 .* s24
oy = c1 .* c5 - s5 .* s1 .* c24
oz = -s5 .* s24

ax = -c1 .* s24
ay = -s1 .* s24
az = c24

xe = ( L2 * c2 + L3 * c23 - (L4+L5) * s24 ) .* c1
ye = ( L2 * c2 + L3 * c23 - (L4+L5) * s24 ) .* s1
ze = L1 + L2 * s2 + L3 * s23 + (L4+L5) * c24

