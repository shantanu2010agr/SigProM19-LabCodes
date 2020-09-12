function z=analysis(A,B)

subplot(3,2,1:2);

zplane(A,B);
%Plotting pole-zero of the transfer function.

[h,w] = freqz(A,B,[-3*pi:0.01:3*pi]);

subplot(3,2,3);
plot(w,(20*log10(abs(h))));
xlabel('frequency(w)');
ylabel('magnitude');
%plotting magnitude of the transfer function

subplot(3,2,4);
plot(w,angle(h));
xlabel('frequency(w)');
ylabel('phase difference');
%plotting phase difference of transfer function

subplot(3,2,5:6);
impz(A,B);
%Plotting impulse response of the transfer function.

end