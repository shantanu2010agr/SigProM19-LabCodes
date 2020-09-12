function y= aane_do(p,N)

wc=0.4*pi;
M=(N-1)/2;
a =zeros(1,N);

for i=1:N
    a(i) = sin(0.1*pi*i)+sin(0.7*pi*i);
end

if p == 0 
    %tbvals=[0.75,0.25],transition
    h = transitionband(N,wc,[0.75,0.25]);
elseif p == 1 
    %11.1(a)
    [w,h] = type1_dft(N,wc);
else
    %11.1(d)
    [w,h] = type2_dft(N,wc);
end
    
al=conv(a,h);
Al=fft(al);
sAl=fftshift(Al);


subplot(411);
plot(a);
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(412);
plot(20*log10(abs(fftshift(fft(a)))));
title('Magnitude of FFT of input signal(in dB)');
xlabel('Frequency');
ylabel('Amplitude');

subplot(413);
plot(al);
title('Convolution of Input with Filter');
xlabel('Time');
ylabel('Amplitude');

subplot(414);
plot(abs(sAl));
title('Final Output');
xlabel('Frequency');
ylabel('Amplitude');

end