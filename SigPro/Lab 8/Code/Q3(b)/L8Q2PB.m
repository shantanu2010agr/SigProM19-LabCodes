function p= L8Q2PB(x)
  
    tfftb=tic;
    fft(x);
    % Using In-built FFT
    ibfft=toc(tfftb);
    
    tdftb=tic;
    directdft(x);
    % Using DirectDFT function
    ddft=toc(tdftb);
    
    disp('In built FFT:');
    disp(ibfft);
    disp('Direct DFT:');
    disp(ddft);
    end
