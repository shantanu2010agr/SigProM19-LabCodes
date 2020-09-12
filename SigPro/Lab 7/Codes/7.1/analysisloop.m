function z = analysisloop(x,y)

for p=x:0.5:y
    %Checking the behaviour for different values of p.
    analysis(1,[1,-p]);
    pause(1);
end

end