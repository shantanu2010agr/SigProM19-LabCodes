t=-6*pi:0.001:6*pi;
x=sin(t);
xn=square(x);
A=fouriercoefficients(xn,20);

subplot(2,3,1);
plot(t,xn);
title("Signal in time domain");
xlabel('time');
ylabel('x(t)');

subplot(2,3,2:3);
plot(-20:20,A);
title("Fourier coefficients");
xlabel('Value of k');
ylabel('a_k');

Anew=LPF(A,3.5);
y=partialfouriersums(Anew,T,t);
subplot(2,3,4);
plot(t,y);
title('Low Pass Filter');
xlabel('time');
ylabel('Low Passed signal');

Anew=HPF(A,3.5);
y=partialfouriersums(Anew,T,t);
subplot(2,3,5);
plot(t,y);
title('High Pass Filter');
xlabel('time');
ylabel('High Passed signal');

Anew=func_c(A);
y=partialfouriersums(Anew,T,t);
subplot(2,3,6);
plot(t,y);
title('Function applied');
xlabel('time');
ylabel('Output signal');