function z=complext()
theta=pi/3;
%Taking r constant for the expression of 2nd question.
for r=0:0.1:1
% Running loop for different values of theta.
   analysis(1,[1,-(2*r*cos(theta)),r^2]);  
   pause(0.5);
end
end
