function z = partb()

t_fine = 0:0.0001:2;
t = 0:0.1:2;

x = 1 + sin(3*pi*t_fine)+ cos(5*pi*t_fine);
a = 1 + sin(3*pi*t)+cos(5*pi*t);
%Sampled signal

z = interp1(0:0.1:2,a,t_fine,'linear');
%Interpolation function

plot(t_fine,x,'g',t_fine,z,'r');
xlabel('Time');
ylabel('Amplitude');
title('Linear Interpolation');
legend('Original Signal', 'Linear Interpolated Signal')