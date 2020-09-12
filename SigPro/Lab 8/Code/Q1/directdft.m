function X = directdft(x)
% x is a length-N column vector
N = size(x,2);
F = zeros(N,N);
% F is a NxN DFT-matrix.
X = zeros(1,N); 

for a = 1:N
    for b =1:N
        F(a,b) = exp(((-1*1i*2*pi)/N)*(a-1)*(b-1));
    end
end

X = F*(transpose(x));
%direct computation of DFT.

subplot(211);
stem(1:N,x);
title('Input Signal');
xlabel('N');
ylabel('x(n)');

subplot(212);
stem(1:N,abs(X));
ylabel('abs(X[k])');
xlabel('k');
title('N-DFT Magnitude');

end
        