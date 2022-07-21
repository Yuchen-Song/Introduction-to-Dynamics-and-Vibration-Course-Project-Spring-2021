L1 = 0.35; L2 = 1; L3 = 1; a = 0.6; b = 0.4; alpha1 = 3;  
L4 = sqrt(a^2+b^2); 
Ttotal = sqrt(2*pi*2/alpha1);
t = linspace(0, Ttotal, 100);
resolution = 100;
theta1 = [];
w1 = 3*t;
alp1 = 0*t+3;
for i = 1:resolution
    theta1_ = (-33.7/180)*pi+(1/2)*alpha1*(t(i)^2);
    theta1 = [theta1 theta1_];
end
fun_theta2_para = @(the1, the2) (L1*cos(the1)+L2*cos(the2)-L4)^2+ ...
    (L1*sin(the1)+L2*sin(the2))^2-L3^2;
fun_theta3_para = @(the1, the3) (L3*cos(the3)-L1*cos(the1)+L4)^2+ ...
    (L3*sin(the3)-L1*sin(the1))^2-L2^2;
theta2 = []; theta3 = [];
t2_last = (100.7/180)*pi; t3_last = (127.9/180)*pi;
for i = 1:resolution
    the1 = theta1(i);
    fun_theta2 = @(the2) fun_theta2_para(the1, the2);
    fun_theta3 = @(the3) fun_theta3_para(the1, the3);
    t2_next = fzero(fun_theta2, t2_last);
    t3_next = fzero(fun_theta3, t3_last);
    t2_last = t2_next;
    t3_last = t3_next;
    theta2 = [theta2 t2_next];
    theta3 = [theta3 t3_next];
end
w2 = diff(theta2) ./ diff(t);
w3 = diff(theta3) ./ diff(t);
alp2 = diff(w2) ./ diff(t(1:resolution-1));
alp3 = diff(w3) ./ diff(t(1:resolution-1));

figure(5)
hold;
plot(t(1:resolution-2), alp1(1:resolution-2), '-r')
plot(t(1:resolution-2), alp2, '-g')
plot(t(1:resolution-2), alp3, '-b')
grid on;
title('Angular acceleration');
xlabel('t(s)');
ylabel('¦Á(rad/s^2)');
legend('L1','L2','L3');

