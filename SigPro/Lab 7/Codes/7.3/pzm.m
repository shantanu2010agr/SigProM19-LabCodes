function z=pzm()

subplot(211);
zplane([1,-5,6],[1,-2.5,1]);
%Pole and zero plot of the system function mentioned in 3rd question in the
%form of difference equation.

subplot(212);
impz([1,-5,6],[1,-2.5,1]);
%Gives the impulse response of the causal system with ROC mod(Z)>0.5
end