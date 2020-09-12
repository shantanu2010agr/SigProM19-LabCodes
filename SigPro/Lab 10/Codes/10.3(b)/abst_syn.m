function y= abst_syn(p,N)

wc=0.4*pi;
M=(N-1)/2;
hd = zeros(1,N);
hp= zeros(1,N);
h = zeros(1,N);

a = synthesizer([5000,2000,300,320,30060,4000,450],[5,5,5,5,5,5,5],rand([1,7]),[2,1,0.5,1],48000);


for i=1:N
    if (i== M)
        hd(i)=.4;
    else
        hd(i) = (sin(wc*(i-M))) / (pi*(i-M));
    end
end

if p==0
    w=rectwin(N);
elseif p==1
    w= bartlett(N);
elseif p==2
    w= hamming(N);
elseif p==3
    w= hann(N);
else
    w= blackman(N);
end

for i=1:N
h(i) = w(i)*hd(i);
end


for i =1:N
    hp(i)=((-1)^(i-1))*h(i);
end

%plot(hp);
al=conv(a,h);
ah=conv(a,hp);

Al=fft(al);
Ah=fft(ah);

sAl=fftshift(Al);
sAh=fftshift(Ah);

subplot(321);
plot(a);
title('Input Signal');
xlabel('Time');
ylabel('Amplitude');
subplot(322);
plot(20*log10(abs(fftshift(fft(a)))));
title('Magnitude of FFT of input signal(in dB)');
xlabel('Frequency');
ylabel('Amplitude');

subplot(323);
plot(al);
title('Convolution of Input with Low-Pass Time domain signal');
xlabel('Time');
ylabel('Amplitude');
subplot(324);
plot(abs(sAl));
title('Low-Pass Filter');
xlabel('Frequency');
ylabel('Amplitude');

subplot(325);
plot(ah);
title('Convolution of Input with High-Pass Time domain signal');
xlabel('Time');
ylabel('Amplitude');
subplot(326);
plot(abs(sAh));
title('High-Pass Filter');
xlabel('Frequency');
ylabel('Amplitude');

end