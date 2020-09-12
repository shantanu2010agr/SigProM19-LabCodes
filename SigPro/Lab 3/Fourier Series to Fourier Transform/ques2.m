T1=1/4;
t=-5:0.01:5;
for T=1:10
    N=round(2*T/T1);
    [A,y,sq]=squareF5s(T,T1,t,N);
    stem(A);
    title('Fourier Series to Fourier Transform');
    xlabel('Value of k in a_k');
    ylabel('a_k');
    pause(0.5);
end