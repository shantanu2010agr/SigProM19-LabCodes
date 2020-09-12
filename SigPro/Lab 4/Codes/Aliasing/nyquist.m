function x = nyquist()

rate = 2*5*pi;
disp("Nyquist rate : "+rate);
%printing nyquist rate

t_fine=0:0.0001:2;
x = cos(5*pi*t_fine);

y=partc(0.1);
%ts = 0.1s
subplot(131);
plot(t_fine,y,'g',t_fine,x,'r');
title('Aliasing for Ts=0.1');
xlabel('Time');
ylabel('Amplitude');
hold on;
t=0:0.1:2;
b = cos(5*pi*t);
stem(t,b,'b');
legend('Sampled signal','Original signal','Samples');

y=partc(0.2);
%ts = 0.2s
subplot(132);
plot(t_fine,y,'g',t_fine,x,'r');
title('Aliasing for Ts=0.2');
ylabel("Amplitude");
xlabel("Time");
hold on;
t=0:0.2:2;
b = cos(5*pi*t);
stem(t,b,'b');
legend('Sampled signal','Original signal','Samples');

y=partc(0.3);
%ts = 0.3s
subplot(133);
plot(t_fine,y,'g',t_fine,x,'r');
title('Aliasing for Ts=0.3');
xlabel("Time");
ylabel("Amplitude");
hold on;
t=0:0.3:2;
b = cos(5*pi*t);
stem(t,b,'b');
legend('Sampled signal','Original signal','Samples');

end