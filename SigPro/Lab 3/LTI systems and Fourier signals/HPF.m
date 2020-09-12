function Anew=HPF(A,wc)
    Anew=A;
    p=size(A);
    q=(p-1)/2;
    for k=-q:q
        if(abs(k)<wc)
            Anew(k+q+1)=0;
        end
    end
end