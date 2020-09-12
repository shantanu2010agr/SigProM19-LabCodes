A=ones(1,15);

subplot(2,3,1:3);
plot(A);
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