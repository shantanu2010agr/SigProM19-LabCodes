function y = partialfouriersum(A,T,t)
    y = zeros(size(t));
    %because number of fourier coefficients is 2*N+1 
    N = (size(A,2)-1)/2;
    
    for k = -N:N
        %fourier series reconstruction 
        y = y + A(k+N+1)*exp(1i*2*pi*k*t/T);
    end
    plot(t,y,'r');
    xlabel('Time');
    ylabel('y(t)');
    title('Fourier series reconstruction');
end
