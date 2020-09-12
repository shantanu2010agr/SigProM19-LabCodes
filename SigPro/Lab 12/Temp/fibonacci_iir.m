function [fib,b,a] = fibonacci_iir(n)
% Determine IIR filter that produces Fibonacci sequence
b = [1];
a = [1,-1,-1];
% Create length-n impulse to drive filter
imp = [1,zeros(1,n-1)];
% Determine impulse response
fib = filter(b,a,imp);
plot(fib);
figure;
zplane(b,a);
end
