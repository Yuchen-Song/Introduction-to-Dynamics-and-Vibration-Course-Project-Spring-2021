% Author Yuchen Song
% 2021-6-13 10:26
clc;clear;
syms t x y o2 o3; l1=0.35; l2=1; l3=1;
tmax = sqrt(4*pi/3); o1 = 3*t;
omega1 = [0, 0, o1]; omega2 = [0, 0, o2]; omega3 = [0, 0, o3];
theta = 1.5*t*t;
A = [l1*cos(theta), l1*sin(theta), 0];
rOA = A-0;
vA = cross(omega1, rOA);
B = [x, y, 0];
C = [0.6, 0.4, 0];
y = (0.17+(0.7*cos(theta)-1.2)*x)/(0.8-0.7*sin(theta));
x = solve(0.36+x*x-1.2*x+0.16+y*y-0.8*y==1);
x = x(2);
rAB = B-A; rBC = C-B;
vB1 = vA + cross(omega2, rAB);
vB2 = cross(omega3, rBC);
eqns2 = [vB1(1)==vB2(1), vB1(2)==vB2(2)];
vars2 = [o2, o3];
[o2, o3] = solve(eqns2, vars2);
alpha1 = 3+0*t; alpha2 = diff(o2, t); alpha3 = diff(o3, t);
alpha2 = subs(alpha2); alpha3 = subs(alpha3); 
o2 = subs(o2); o3 = subs(o3);

%plotting
hold;
grid on;
span = [0,tmax,-6.2,6.2];
po1 = ezplot(o1,span);
set(po1,'Color','r');
po2 = ezplot(o2,span);
set(po2,'Color','g');
po3 = ezplot(o3,span);
set(po3,'Color','b');

pa1 = ezplot(alpha1,span);
set(pa1,'linestyle','--','Color','r');
pa2 = ezplot(alpha2,span);
set(pa2,'linestyle','--','Color','g');
pa3 = ezplot(alpha3,span);
set(pa3,'linestyle','--','Color','b');
title('Angular velocity & acceleration');
xlabel('t(s)');
ylabel('¦Ø(rad/s) or ¦Á(rad/s^2)');
legend('L1¦Ø','L2¦Ø','L3¦Ø','L1¦Á','L2¦Á','L3¦Á');
