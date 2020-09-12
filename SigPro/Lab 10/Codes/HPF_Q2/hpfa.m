function y= hpfa(a,N)

wc=0.4*pi;
n=1001;
M=(N-1)/2;
hd = zeros(N);

for i=1:N
    if (i== M)
        hd(i)=.4;
    else
        hd(i) = (sin(wc*(i-M))) / (pi*(i-M));
    end
end

if a==0
    w=rectwin(N);
elseif a==1
    w= bartlett(N);
elseif a==2
    w= hamming(N);
elseif a==3
    w= hann(N);
else
    w= blackman(N);
end

h = hd.*w;
H= fft(h);

for i =1:N
    hp(i)=((-1)^(i-1))*h(i);
end

%plot(abs(fftshift(fft(hp))));

subplot(131);
plot(hp);
title('Impulse Response');
xlabel('Time');
ylabel('Amplitude');
subplot(132);
plot(20*log10(abs(fftshift(fft(hp)))));
title('Magnitude of Frequency Response(dB)');
xlabel('Frequency');
ylabel('Amplitude');
subplot(133);
plot(angle(fftshift(fft(hp))));
title('Phase of Frequency Response');
xlabel('Frequency');
ylabel('Amplitude');

end