function [conv_circ, conv_lin] = dftconv(h,x,N)

lx=length(x);
lh=length(h);
%Finding length of x and h

if N<max([lx lh])
    % Checking for true value of N
    error('N must be at least the length of the longer signal.')
end

%Use of zero-padding in both the cases.

h_circ = [h, zeros(1,N-lh)];
x_circ = [x, zeros(1,N-lx)];
%Making the length of vectors equal to N for circular convolution.

conv_circ = ifft(fft(h_circ).*fft(x_circ));
%Transformation of covoluted signals is their multiplication
%And hence their inverse inverse-FFT(in-built) to get the output signal.

h_lin = [h, zeros(1,lx-1)];
x_lin = [x, zeros(1,lh-1)];
%Making the length of matrix equal to (lx+lh-1) and solve it similar to
%circular convolution.

conv_lin = ifft(fft(h_lin).*fft(x_lin));
%Same theory as of circular convolution.

convAns = conv(x,h);
cconvAns = cconv(x,h,N);
%Using inbuilt functions to verify the results.

subplot(2,2,1);
plot(conv_circ);
title('Cirular Convolution');
xlabel('N');
ylabel('y[N]');

subplot(2,2,2);
plot(cconvAns);
title('Verification with In-built cconv');
xlabel('N');
ylabel('y[N]');

subplot(2,2,3);
plot(conv_lin);
title('Linear Convolution');
xlabel('N');
ylabel('y[N]');

subplot(2,2,4);
plot(convAns);
title('Verification with In-built conv');
xlabel('N');
ylabel('y[N]');

end







