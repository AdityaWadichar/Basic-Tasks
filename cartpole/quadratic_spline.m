function [x1] = quadratic_spline(x,x_dot,t)
    N = length(x);
    x1 = zeros(size(t));
    k = 1;
    h = t(length(t))/(N-1);
    for i = 1:N-1
        while ( t(k) >= (i-1)*h ) && ( t(k) < i*h )
            tau = t(k) - h*(i-1);
            x1(k) = x(i) + tau*x_dot(i) + ((tau^2)/(2*h))*(x_dot(i+1)-x_dot(i));
            k = k + 1 ;
        end
    end
    x1(length(t)) = x(N);