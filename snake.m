clear
clc

P0=[0;0;0;1];
d= 0;
b= pi/2;

syms t;

a1 = angle(1);
a2 = angle(2);
a3 = angle(3);
a4 = angle(4);
a5 = angle(5);
a6 = angle(6);
a7 = angle(7);
a8 = angle(8);
a9 = angle(9);
a10= angle(10);


A0_1 = trans(10,0,b,a1);
A1_2 = trans(10,0,-b,a2);
A2_3 = trans(10,0,b,a3);
A3_4 = trans(10,0,-b,a4);
A4_5 = trans(10,0,b,a5);
A5_6 = trans(10,0,-b,a6);
A6_7 = trans(10,0,b,a7);
A7_8 = trans(10,0,-b,a8);
A8_9 = trans(10,0,b,a9);
A9_10= trans(10,0,-b,a10);

% A=double(subs(A0_1,t,0))*double(subs(A1_2,t,0))
% B= double(subs((A0_1*A1_2),t,0))

for j= 0:0.1:50
    
    P1 = double(subs(A0_1,t,j))*P0;
    P2 = double(subs((A0_1*A1_2),t,j))*P0;
    P3 = double(subs((A0_1*A1_2*A2_3),t,j))*P0;
    P4 = double(subs((A0_1*A1_2*A2_3*A3_4),t,j))*P0;
    P5 = double(subs((A0_1*A1_2*A2_3*A3_4*A4_5),t,j))*P0;
    P6 = double(subs((A0_1*A1_2*A2_3*A3_4*A4_5*A5_6),t,j))*P0;
    P7 = double(subs((A0_1*A1_2*A2_3*A3_4*A4_5*A5_6*A6_7),t,j))*P0;
    P8 = double(subs((A0_1*A1_2*A2_3*A3_4*A4_5*A5_6*A6_7*A7_8),t,j))*P0;
    P9 = double(subs((A0_1*A1_2*A2_3*A3_4*A4_5*A5_6*A6_7*A7_8*A8_9),t,j))*P0;
    P10= double(subs((A0_1*A1_2*A2_3*A3_4*A4_5*A5_6*A6_7*A7_8*A8_9*A9_10),t,j))*P0;


    p_x=[P0(1,1) ,P1(1,1) ,P2(1,1) ,P3(1,1) ,P4(1,1) ,P5(1,1) ,P6(1,1) ,P7(1,1) ,P8(1,1) ,P9(1,1) ,P10(1,1)];
    p_y=[P0(2,1) ,P1(2,1) ,P2(2,1) ,P3(2,1) ,P4(2,1) ,P5(2,1) ,P6(2,1) ,P7(2,1) ,P8(2,1) ,P9(2,1) ,P10(2,1)];
    p_z=[P0(3,1) ,P1(3,1) ,P2(3,1) ,P3(3,1) ,P4(3,1) ,P5(3,1) ,P6(3,1) ,P7(3,1) ,P8(3,1) ,P9(3,1) ,P10(3,1)];
    
    hold on;
    fig = plot3(p_x,p_y,p_z,'o-','LineWidth',4,'color','0,0,0',...
    'MarkerEdgeColor','[0,0,1]');
    grid on;
    xlim([-200,200]);
    ylim([-200,200]);
    zlim([-200,200]);
    pause(0.01);

    delete(fig);


end
  

function trans_out = trans(a,d,az,ax) 
trans_out = [cos(ax)  ,-sin(ax)*cos(az)  ,sin(ax)*sin(az) ,  a*cos(ax);
             sin(ax)  ,cos(ax)*cos(az)   ,-cos(ax)*sin(az),  a*sin(ax);
              0       , sin(az)          ,    cos(az)     ,  d        ;
              0       ,   0              ,      0         ,  1       ];
end

function ax = angle(n) 
syms t
Ax=pi/3;
Ay=0;
Wx=5*pi/6;
Wy=5*pi/6;
deltax= 2*pi/3;
deltay =0;
phi=0;
if mod(n,2) == 0
    ax= Ax * sin(Wx*t + n*deltax);
else
    ax = Ay*sin(Wy*t  + n* deltay + phi);
end
end
