function y = harmonics(t,fo,harmamps,harmphase)

N = length(harmamps);
%N length vector

y = zeros(size(t));
%creating vector y with length same as time

fs = 48000;
%sampling frequency

for i = 1:N 
   for j = 1:length(t)
       y(j) = y(j) + harmamps(i)*sin( (2*pi*i*fo*t(j)) + harmphase(i) );
       %evaluating harmonics
   end
end

y = (y/max(y(:)))*0.95;
%Normalizing maximum amplitude o 0.95 so that sound doesn't distort 

sound(y,fs);
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Harmonic Signals');

