function [x1] = linear_spline(x,t)
    N = length(x);
    x1 = zeros(size(t));
    k = 1;
    h = t(length(t))/(N-1);
    for i = 1:N-1
        while ( t(k) >= (i-1)*h ) && ( t(k) < i*h )
            tau = t(k) - h*(i-1);
            x1(k) = x(i) + (tau/h)*(x(i+1)-x(i));
            k = k + 1 ;
        end
    end
    x1(length(t)) = x(N);