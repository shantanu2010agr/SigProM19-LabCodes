function X= dtft(x, N0, w)

X=zeros(length(w));
%declare a vector of length same as frequency

for i=1:length(w)
    X(i)=0;
    %discretizing
    for n=1:length(x)
        X(i)=X(i)+x(n)*exp(-1i*w(i)*(n-N0));
        %DTFT
    end
end

figure;
subplot(211);plot(w,abs(X));
xlabel('Frequency');
ylabel('Amplitude');
title('Magnitude');

subplot(212);plot(w,angle(X));
xlabel('Frequency');
ylabel('Amplitude');
title('Phase');


figure;
subplot(211);plot(w,real(X));
xlabel('Frequency');
ylabel('Amplitude');
title('Real part');

subplot(212);plot(w,imag(X));
xlabel('Frequency');
ylabel('Amplitude');
title('Imaginary part');

end
