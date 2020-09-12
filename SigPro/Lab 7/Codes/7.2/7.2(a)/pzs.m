function z=pzs(r, theta)
% Taking input the required r and the theta from the expression of transfer
% function.
zplane([1,0],[1,-(2*r*cos(theta)),r^2]);
% Inuilt function which shows poles by cross (X) sign and zeroes by circle (o) sign. 
end