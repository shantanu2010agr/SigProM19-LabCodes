function Y= Q4(w)
Y=zeros(length(w));

for i=1:length(w)
    Y(i)=1/(1+0.9*exp(-1j*w(i)));
end

figure;
subplot(211);plot(w,abs(Y));
xlabel('Frequency');
ylabel('Amplitude');
title('Magnitude');

subplot(212);plot(w,angle(Y));
xlabel('Frequency');
ylabel('Amplitude');
title('Phase');

end
