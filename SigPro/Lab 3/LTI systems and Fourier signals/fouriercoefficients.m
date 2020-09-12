function A = fouriercoefficients(B,N)

    
A=zeros(2*N+1);
    
T=2*pi;
    
wo=2*pi/T;
    
t=-3*T:0.001:3*T;
    
for k=-N:N
        
for i=1:size(t,2)
            
A(k+N+1)=A(k+N+1)+B(i)*exp(-1*1i*k*wo*t(i));
        
end
    
end
    
    
A=A/size(t,2);

%plot(-N:N,A);
    
