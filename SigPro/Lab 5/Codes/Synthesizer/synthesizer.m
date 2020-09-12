function y =  synthesizer(notes,durs,harmamps,adsr,fs)

y = [];
%empty

for i = 1:length(notes)
    [t,e] = envelope(fs,adsr(1),adsr(2),adsr(3),durs(i)-adsr(1)-adsr(2)-adsr(4),adsr(4));
    %envelope
    
    h = harmonics(t,notes(i),harmamps,rand([1,7]));
    %harmonic
    
    n = h.*e;
    %modulating
    
    y = [y,n];
    %concatening
    
end

sound(y,fs);
plot(y);
xlabel('Time');
ylabel('Amplitude');
title('Synthesizer');

%suggested input: 
%synthesizer([240,270,300,320,360,400,450],[5,5,5,5,5,5,5],rand([1,7]),[2,1,0.5,1],48000)

end

    
    