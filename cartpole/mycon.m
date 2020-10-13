function [c,ceq] = mycon(x)
    global N;
    T = 2;
    h = T/(N-1);
    c = [];
    d = 1;
    ceq = [];
    for k = 1:N-1
        state = [x(k),x(N+k),x(2*N+k),x(3*N+k)];
        next_state = [x(k+1),x(N+k+1),x(2*N+k+1),x(3*N+k+1)];
        u = x(4*N+k);
        u_next = x(4*N+k+1);
        x_dot = dynamics(state,u);
        x_dot_next = dynamics(next_state,u_next);
        ceq = [ceq , next_state - state - (h/2)*(x_dot+x_dot_next)];
    end
    ceq = [ceq ,x(1),x(N+1),x(2*N+1),x(3*N+1),x(4*N+1),x(N)-d,x(2*N)-pi,x(3*N),x(4*N), x(5*N)];