function y = partc(ts)

t_fine = 0:0.0001:2;
t = 0:ts:2;
%using ts = 0.1s

x = 1 + sin(3*pi*t_fine)+ cos(5*pi*t_fine);
a = 1 + sin(3*pi*t)+cos(5*pi*t);
%Sampled signal

n = length(t);
y = zeros(size(t_fine));
for i = 1:length(t_fine)
    for s = 1:n
       if(t_fine(i)~=((s-1)*ts))
        
            y(i) = y(i) + ts*a(s)*sin(pi*(t_fine(i)-(s-1)*ts)/ts)/(pi*(t_fine(i)-(s-1)*ts));
            %Reconstruction
       else
           y(i) = y(i) + a(s);
       
       end
       
    end
end

plot(t_fine,x,'r',t_fine,y,'g');
xlabel('Time');
ylabel('Amplitude');
title('Reconstruction of Signal using Sinc function');
legend('Original Signal', 'Reconstructed Signal');
