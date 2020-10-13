function result = myfun(x)
    global N;
    result = 0;
    T = 2;
    h = T/(N-1);
    for k = 1:N-1
        result = result + (h/2)*(x(k+4*N)^2 + x(k+4*N+1)^2);
    end
end