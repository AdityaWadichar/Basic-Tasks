clear
clc
b=0.5; g=9.8; L=1.5;
ini_pos=0;
ini_vel=2.5;
T=2000;
t=0.01;
theta=zeros(1, T);
omega=zeros(1, T);
theta(1)=ini_pos;
omega(1)=ini_vel;
for i=1:T-1
    theta(i+1)=theta(i)+omega(i)*t-(1/2)*(b*omega(i)+g*sin(theta(i))/L)*t^2;
    omega(i+1)=(theta(i+1)-theta(i))/t;
end

subplot(2,1,1)
%axis([0 20 -4 4])
plot([1:T]*t, omega, '.b')
xlabel('Time');
ylabel('angular velocity')


for k=1:T
    

subplot(2,1,2)
axis(gca, 'equal')
axis([-2 2 -2 2])

    crack= line([0 L*sin(theta(k))], [0 -L*cos(theta(k))]);
    circ1= viscircles([0 0], 0.05);
    circ2= viscircles([L*sin(theta(k)) -L*cos(theta(k))], 0.05);
    pause(0.0000001);
    delete([crack, circ1, circ2]);

end
