L=1;
a=0.2;
b=0.1;
line([-10 10], [-b, -b]);

for k=1:100
axis(gca, 'equal')
axis([-1.5 2.5 -2 2])
    
    crack= line([x(k), x(k)+L*sin(x(N+k))], [0, -L*cos(x(N+k))] );
    circ1= viscircles([x(k)+L*sin(x(N+k)) -L*cos(x(N+k))], 0.05);
    crack1= line([x(k)-a, x(k)+a], [b, b]);
    crack2= line([x(k)-a, x(k)+a], [-b, -b]);
    crack3= line([x(k)-a, x(k)-a], [-b, b]);
    crack4= line([x(k)+a, x(k)+a], [-b, b]);
    
    pause(0.067);
    delete([crack, crack1, crack2, crack3, crack4]);
    delete(circ1);
end
