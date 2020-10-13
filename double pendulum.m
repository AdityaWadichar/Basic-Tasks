clear
clc

m1=1; m2=1;
L1=0.5; L2=0.5;
g=9.81;
pos1=deg2rad(45);
pos2=deg2rad(30);
vel1=0;
vel2=0.1;


time=10;

tspan=[0 time];

cond=[pos1; vel1; pos2; vel2];

[t, x]= ode45(@(t, x) [x(2); (-m2*L1*(x(2)^2)*sin(x(1)-x(3))*cos(x(1)-x(3))...
    + m2*g*sin(x(3))*cos(x(1)-x(3)) - m2*L2*(x(4)^2)*sin(x(1)-x(3))...
    - g*(m1+m2)*sin(x(1)))/(m1*L1 + m2*L1*(sin(x(1)-x(3)))^2); x(4);...
    (cos(x(1)-x(3))/(m1*L1 + m2*L2*(sin(x(1)-x(3)))^2))*(m2*L1*sin(x(1)-x(3))*cos(x(1)-x(3))...
    - m1*g*sin(x(4))*cos(x(1)-x(3)) + m2*L2*(x(4)^2)*sin(x(1)-x(3))...
    + g*(m1+m2)*sin(x(1))) + L1*(x(2)^2)*sin(x(1)-x(3)) - g*sin(x(4))], tspan, cond);
%plot(x(:,1), x(:,3));
figure
for k=1:length(t)
    %title('t= %f', num2string(double(t(k, 1))))
    axis([-L1-L2-0.5 L1+L2+0.5 -L1-L2-0.5 L1+L2+0.5])
    line1= line([0 L1*sin(x(k, 1))], [0 -L1*cos(x(k, 1))]);
    line2= line([L1*sin(x(k, 1)) L1*sin(x(k, 1))+L2*sin(x(k, 3))], [-L1*cos(x(k, 1)) -L1*cos(x(k, 1))-L2*cos(x(k, 3))]);
    circ1= viscircles([L1*sin(x(k, 1)) -L1*cos(x(k, 1))], 0.02);
    circ2= viscircles([L1*sin(x(k, 1))+L2*sin(x(k, 3)) -L1*cos(x(k, 1))-L2*cos(x(k, 3))], 0.02);
    pause(0.01)
    if k<length(t)
        delete(line1)
        delete(line2)
        delete(circ1)
        delete(circ2)
    end
end

figure
plot(x(:,2), x(:,4));
