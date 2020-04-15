%流体力欧拉法加速度求解%
clear all
clc
syms t x y z;
format('long')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=1;
y0=2;
z0=3;
t0=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ux=x*y^2;
uy=-(1/3)*y^3;
uz=x*y;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ax=diff(ux,t)+ux*diff(ux,x)+uy*diff(ux,y)+uz*diff(ux,z);
ay=diff(uy,t)+ux*diff(uy,x)+uy*diff(uy,y)+uz*diff(uy,z);
az=diff(uz,t)+ux*diff(uz,x)+uy*diff(uz,y)+uz*diff(uz,z);
a=sqrt(ax^2+ay^2+az^2);
disp(['ax' ax;'ay' ay;'az' az;'a' a])


ax0=subs(ax,{x,y,z,t},{x0 y0 z0 t0});
ay0=subs(ay,{x,y,z,t},{x0 y0 z0 t0});
az0=subs(az,{x,y,z,t},{x0 y0 z0 t0});
a0=subs(a,{x,y,z,t},{x0 y0 z0 t0});


disp(['ax0' ax0;'ay0' ay0;'az0' az0;'a0' a0])