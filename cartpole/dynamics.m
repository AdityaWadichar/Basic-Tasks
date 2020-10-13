function x_dot = dynamics(x,u)
    l = 0.5;
    m1 = 0.5;
    m2 = 0.1;
    g = 9.81;
    a = x(3);
    b = x(4);
    c = l*m2*sin(x(2))*x(4)^2 + u + m2*g*cos(x(2))*sin(x(2));
    c = c/(m1+m2*sin(x(2))^2);
    d = l*m2*cos(x(2))*sin(x(2))*(x(4))^2 + u*cos(x(2)) + (m1+m2)*g*sin(x(2));
    d = d/(l*m1 + l*m2*sin(x(2))^2);
    x_dot = [a,b,c,-d];
end