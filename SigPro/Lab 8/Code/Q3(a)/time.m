function p= time()

ibfft= zeros(10);
radfft= zeros(10);
ddft= zeros(10);
% Creating empty arrays of timings.

        for a=1:10
    x=rand([1,power(2,a)]);
    % Generating random signals of length 2^a.
    
    tfftb=tic;
    fft(x);
    % Using In-built FFT.
    ibfft(a)=toc(tfftb);
    
    tdftb=tic;
    directdft(x);
    % Using Direct DFT function
    ddft(a)=toc(tdftb);
    
    trfftb=tic;
    radix2fft(x);
    % Using Radix-2 FFT function
    radfft(a)=toc(trfftb);
        end
        
plot(1:10,ibfft,1:10,radfft,1:10,ddft);
legend('Radix-2 fft','Direct FFT','In built FFT');
xlabel('Power of 2');
ylabel('Time');
title('For powers of 2');

    end
