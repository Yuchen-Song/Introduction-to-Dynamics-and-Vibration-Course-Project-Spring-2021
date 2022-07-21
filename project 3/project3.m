%Author Yuchen Song
%2021/06/17 20:42
clc;clear;
hold on;
frequency_ratio = 0:0.01:5;
damping_factors = [0.2:0.2:1];
colors = ['r','g','b','y','c'];
for i=1:length(damping_factors)
    c = colors(i);
    Tm = sqrt((2*damping_factors(i).*frequency_ratio).^2+1) ...
        ./sqrt((1-frequency_ratio.^2).^2 + ...
        (2*damping_factors(i).*frequency_ratio).^2);
    plot(frequency_ratio, Tm, c);
end
legend('��=0.2','��=0.4','��=0.6','��=0.8','��=1.0');
xlabel('��f/��n');
ylabel('Tm');


