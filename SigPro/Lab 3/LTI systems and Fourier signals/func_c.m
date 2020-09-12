function Anew=func_c(A)
    Anew=A;
    p=size(A);
    q=(p-1)/2;
    for h=-q:q
        Anew(h+q+1)=A(h+q+1)/(1+1i*h);
    end
%     plot(-q:q,abs(Anew));
end