%流体力欧拉法加速度求解%
clear
clc
syms t x y z;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=1;
y0=2;
z0=3;
t=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ux=x*y^2;
uy=-(1/3)*y^3;
uz=x*y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ax=diff(ux,t)+ux*diff(ux,x)+uy*diff(ux,y)+uz*diff(ux,z);
ay=diff(uy,t)+ux*diff(uy,x)+uy*diff(uy,y)+uz*diff(uy,z);
az=diff(uz,t)+ux*diff(uz,x)+uy*diff(uz,y)+uz*diff(uz,z);
a=sqrt(ax^2+ay^2+az^2);
disp([ax;ay;az;a])
format('long')

ax0=subs(ax,{x,y,z},{x0 y0 z0})
ax0=subs(ay,{x,y,z},{x0 y0 z0})
ax0=subs(az,{x,y,z},{x0 y0 z0})
a0=subs(a,{x,y,z},{x0 y0 z0})

disp('流体力欧拉法加速度求解')