% Author Yuchen Song
% 2021-4-11 17:24
clc;clear;
temp = -4708.8/1150;
c=[temp;0];a=[1,0;0,1]; b=[0.6;1.2];
temp = -274.68/115;
aeq=[temp,1];beq=0;
[x,y]=linprog(c,a,b,aeq,beq,zeros(2,1))
acceleration=y+9025.2/1150