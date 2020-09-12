function [h] = transitionband(N,wc,tbvals)
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
% Determine which indices correspond to the samples just to the
% left and the right of the cutoff frequency (if cutoff freq falls exactly
% on a sample, use that sample and the one to the right).
for p=1:N
    if 2*pi*p/N == wc
        wleftind1 = p;
    elseif 2*pi*p/N <= wc
        wleftind1 = p;
    end
end
wrightind1 = wleftind1 + 1;
wrightind2= N-wleftind1;
wleftind2= wrightind2-1;    

% Update amplitude response with given transition band values at
% these frequencies (remember the symmetry around pi);
Ad(wleftind1) = tbvals(1);
Ad(wrightind2) = tbvals(1);
Ad(wleftind2) = tbvals(2);
Ad(wrightind1) = tbvals(2);
% Compute linear phase vector using correct slope
phi = exp(-1i*w*M);
% Compute ideal frequency samples as product of Ad and phi
H = Ad.*phi;
% Compute filter taps via inverse DFT
h = ifft(H);
H1 = fft(h,1000);
% Make result real to get rid of near-zero imaginary parts
h = real(h);

subplot(311);
plot(h);
title('Impulse Response');

subplot(312);
plot(abs(H1));
title('Magnitude response');

subplot(313);
plot(angle(H1));
title('Phase Response');

end