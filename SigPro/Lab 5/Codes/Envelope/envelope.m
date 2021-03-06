function [t,e] = envelope(fs,a,d,s,dur,r)

t = 0:(1/fs):a;
e = zeros(size(t));
e = e + t/a;
%Attack: 0 to 1 in a sec

tdelay = (a+1/fs):1/fs:a+d;
t = [t,tdelay];
k = zeros(size(tdelay));
k = k + 1 + (s-1)*(1/d)*(tdelay-a);
%Decay: 1 to s in d sec

tsustain = a+d+1/fs:1/fs:a+d+dur;
t = [t,tsustain];
y = ones(size(tsustain))*s;
trelease = a+d+dur+1/fs:1/fs:a+d+dur+r;
%Sustain: Stays at s for dur sec

t = [t,trelease];
g = zeros(size(trelease));
g = g - s*(1/r)*(trelease-a-d-dur-r);
%Release: s to 0 in r sec

e=[e,k,y,g];
%Concat all outputs

sig = harmonics(t,200,randi([1,100],1,5),[0,0,0,0,0]);
sound(sig.*e,fs);
%sound

subplot(211);
plot(t,e);
xlabel('Time');
ylabel('Amplitude of Envelope');
title('Envelope');

subplot(212);
plot(t,sig.*e);
xlabel('Time');
ylabel('Amplitude of Enveloped Signal');
title('Enveloped Signal');

%SUGGESTED INPUT:
%envelope(48000,3,2,0.5,2,3);
end
