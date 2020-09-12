function [max_abs_error,mean_squared_error] = arrow(T,T1,t)
    %Absolute maximimum error    
    max_abs_error = zeros(100);

    %Mean Squared Error
    mean_squared_error = zeros(100);
    
    %Finding errors
    for N = 1:100
        [A y sq] = squareF5(T,T1,t,N);
        max_abs_error(N) = max(abs(y-sq));
        mean_squared_error(N) = mean((y-sq).^2);
    end
    plot(1:100, mean_squared_error,'r',1:100,max_abs_error,'g');
    xlabel('N');
    ylabel('Errors');
    legend('Mean Squared Error', 'Maximum Absolute Error');
    title('Approximation error');
end

