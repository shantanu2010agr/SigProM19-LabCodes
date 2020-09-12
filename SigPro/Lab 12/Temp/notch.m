function [b,a] = notch(w0,r)
t=0:1:2000;

% Compute denominator polynomial from r and w0
a = [1,-r*((exp(1i*w0))+exp(-1i*w0)),r^2];
% Compute numerator polynomial from w0
b = [1,-1*((exp(1i*w0))+exp(-1i*w0)),1];    
% Determine gain so that frequency response has magnitude 1 at w0
b = b*(1-(2*r*cos(w0))+(r^2))/(2*(1-cos(w0)));
x = sin(w0*t)+sin(2*w0*t); 
% Diagnostic display
%freqz(b,a);
y = filter(b,a,x);
subplot(311);
plot(abs(fftshift(fft(y))));
subplot(312);
plot(y);
subplot(313);
plot(abs(fftshift(fft(x))));
end
