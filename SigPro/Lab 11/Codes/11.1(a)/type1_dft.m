function [w,h] = type1_dft(N,wc)

M = (N-1)/2;
% Create vector of equally-spaced frequencies
w=0:2*pi/N:2*pi*(N-1)/N;
% Create ideal amplitude response of low-pass filter
for b=1:N
    if 2*pi*b/N <= wc 
        Ad(b) = 1;
    elseif 2*pi*b/N >= (2*pi-wc)
        Ad(b) = 1;
    else
        Ad(b) = 0;
    end
end
% Compute linear phase vector using correct slope
phi = exp(-1i*w*M);
% Compute ideal frequency samples as product of Ad and phi
H = Ad.*phi;
% Compute filter taps via inverse DFT
h = ifft(H);
H1=fft(h,1000);
% Make result real to get rid of near-zero imaginary parts
h = real(h);
% Plot impulse response, magnitude response, and phase response over a finer frequency grid
subplot(311);
plot(h);
title('Impulse Response');
xlabel('Time');
ylabel('Amplitude');

subplot(312);
plot(abs(H1));
title('Magnitude Response');
xlabel('Frequency');
ylabel('Amplitude');

subplot(313);
plot(angle(H1));
title('Phase Response');
xlabel('Frequency');
ylabel('Amplitude');
end