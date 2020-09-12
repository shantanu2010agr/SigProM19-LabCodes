function X = radix2fft(x)

N = size(x,2);

if ~isequal(unique(factor(N)),2)
    error('N is not a power of 2');
    %Checking if the signal is of length of any power of 2.
end

if N==2
    X = transpose([x(1)+x(2),x(1)-x(2)]);
    %Base case.

else
    x_even = x(1:2:N);
    x_odd = x(2:2:N);
    % Splitting the signal vector into even and odd parts
    
    g = radix2fft(x_even);
    h = radix2fft(x_odd);
    % Applying recursion to smaller parts.
    
    X = zeros(1,N);
    % Generating the output transformed signal.
    
    for k = 1:(N/2)
        X(1,k) = g(k) + exp((-1i*2*pi*(k-1))/N)*h(k);
        X(1,(k+(N/2))) = g(k) - exp((-1i*2*pi*(k-1))/N)*h(k);
    end
    
end

end
        
    
    
     
    
    

