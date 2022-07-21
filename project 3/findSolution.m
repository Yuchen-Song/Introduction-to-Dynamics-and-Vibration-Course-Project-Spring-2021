clc; clear;
syms x
x = solve(((2*x*2.5)^2+1)/((1-2.5^2)^2 ...
    + (2*x*2.5)^2)==0.25,x);
disp('x= ');
disp(vpa(x,8));