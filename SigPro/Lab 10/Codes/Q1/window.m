function y = window(n,N)

w0 = rectwin(N);
w1 = bartlett(N);
w2 = hamming(N);
w3 = hann(N);
w4 = blackman(N);

z0 = 20*log10(abs(fftshift(fft(w0,n))));
%rectwin
z1 = 20*log10(abs(fftshift(fft(w1,n))));
%bartlett
z2 = 20*log10(abs(fftshift(fft(w2,n))));
%hamming
z3 = 20*log10(abs(fftshift(fft(w3,n))));
%hanning
z4 = 20*log10(abs(fftshift(fft(w4,n))));
%blackman

subplot(521);
plot(w0);
title('Rectangular window');
xlabel('Time');
ylabel('Magnitude');
subplot(522);
plot(z0);
title('Rectangular window');
xlabel('Frequency');
ylabel('Magnitude');

subplot(523);
plot(w1);
title('Bartlett window');
xlabel('Time');
ylabel('Magnitude');
subplot(524);
plot(z1);
title('Bartlett window');
xlabel('Frequency');
ylabel('Magnitude');

subplot(525);
plot(w2);
title('hamming window');
xlabel('Time');
ylabel('Magnitude');
subplot(526);
plot(z2);
title('Hamming window');
xlabel('Frequency');
ylabel('Magnitude');

subplot(527);
plot(w3);
title('hanning window');
xlabel('Time');
ylabel('Magnitude');
subplot(528);
plot(z3);
title('hanning window');
xlabel('Frequency');
ylabel('Magnitude');

subplot(529);
plot(w4);
title('Blackman window');
xlabel('Time');
ylabel('Magnitude');
subplot(5,2,10);
plot(z4);
title('Blackman window');
xlabel('Frequency');
ylabel('Magnitude');

end
