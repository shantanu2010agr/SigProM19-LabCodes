function [A,y,sq] = squareF5s(T,T1,t,N)
    %Number of fourier coefficients    
    A = zeros(1,2*N+1);
    %Computing A vector
    for k = -N:N
        for i = 1:size(t,2)
            if(t(i)<=T1 && t(i)>=-T1)
                A(k+N+1) = A(k+N+1) + exp(-1*1i*k*2*pi*t(i)/T);
            end
        end
    end
    
%     A = A/size(t,2);
    
    %Fourier Series Reconstruction(via partialfouriersum.m script)
    y = partialfouriersums(A,T,t);
%     y = real(y);
    
    % Creating square wave using pre-defined function
    sq = rectangularPulse(-T1,T1,t);
    
%     plot( t, y, 'r',t,sq,'g');
%     xlabel('Time');
%     ylabel('Amplitude');
%     legend('Partial sum','Ideal square wave');
%     title('Square Wave');
end
