function y = overlapadd(h,x,N)

subplot(211);
p=conv(h,x);
plot(p);
title('In-Built Convolution');
xlabel('Time');
ylabel('Amplitude');

% If N is not already a power of 2, replace it with the next power of 2
N = 2^(nextpow2(N));

% Compute important lengths
M = length(h);
L = N-M+1;
Lx = length(x);

% Length-N DFT of filter
H = fft(h,N);

% How many blocks will we have?
K = Lx/L+1;

% Pad x with zeros to be a multiple of L
x = [x,zeros(1,L*K-Lx)];

% Initialize y (include some extra zeros at end)
y = zeros(1,length(x)+N);

% Loop over blocks
for i=1:K
    
    % Extract length-L block from x
    if i==1
        block = x(1:L);
    else
        block = x((i-1)*L+1:i*L);
    end
    
    %block = [block , zeros(1,M-1)];
    
    % Take length-N FFT of this block
    B = fft(block,N);
    
    % Compute product in frequency domain and take inverse DFT
    yblock = ifft(B.*H);
    
    % If first block, initialize y
    if i==1
        y(1:N) = yblock;
    else  % Add the result to the appropriate location in y
        y((i-1)*L+1:i*L+M-1) = y((i-1)*L+1:i*L+M-1) + yblock;
    end
    
end

% Trim extra zeros from the end of y to get the correct length convolution
y = y(1:Lx+M-1);

subplot(212);
plot(y);
title('Overlap Add');
xlabel('Time');
ylabel('Amplitude');