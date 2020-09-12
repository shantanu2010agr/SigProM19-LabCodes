function alpha = partd()

t_fine =0:0.0001:2;
x = 1 + sin(3*pi*t_fine)+ cos(5*pi*t_fine);

err1 = mean((parta()-x).^2);
disp("err1 : "+err1);

err2 = mean((partb()-x).^2);
disp("err2 : "+err2);

err3 = mean((partc(0.1)-x).^2);
disp("err3 : "+err3);