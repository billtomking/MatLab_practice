%流体力欧拉法加速度求解%
clear all
clc
syms t x y z;
format('long')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=2;
y0=2;
z0=1;
t0=3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ux=2*t+2*x+2*y;
uy=t-y+z;
uz=t+x-z;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ax=diff(ux,t)+ux*diff(ux,x)+uy*diff(ux,y)+uz*diff(ux,z);
ay=diff(uy,t)+ux*diff(uy,x)+uy*diff(uy,y)+uz*diff(uy,z);
az=diff(uz,t)+ux*diff(uz,x)+uy*diff(uz,y)+uz*diff(uz,z);
a=sqrt(ax^2+ay^2+az^2);

ax0=subs(ax,{x,y,z,t},{x0 y0 z0 t0});
ay0=subs(ay,{x,y,z,t},{x0 y0 z0 t0});
az0=subs(az,{x,y,z,t},{x0 y0 z0 t0});
a0=subs(a,{x,y,z,t},{x0 y0 z0 t0});


mdim(ax,ay,az)%流动的维数
ista(a)%是否是恒定流

if ux*diff(ux,x)+uy*diff(ux,y)+uz*diff(ux,z)==0 && ux*diff(uy,x)+uy*diff(uy,y)+uz*diff(uy,z)==0 && ux*diff(uz,x)+uy*diff(uz,y)+uz*diff(uz,z)==0
    disp('是均匀流')
else
    disp('非均匀流')
end

disp(['ax' ax;'ay' ay;'az' az;'a' a])



disp(['ax0' ax0;'ay0' ay0;'az0' az0;'a0' a0])

function mdim(ax,ay,az)%流动的维数
dim=3;
if ax==0 
   dim=dim-1; 
end
if ay==0
   dim=dim-1; 
end
if az==0 
   dim=dim-1; 
end
disp(['流动的维数：' int2str(dim)])
end


function ista(a)%是否是恒定流
    syms t
    if diff(a,t)==0
        disp('是恒定流')
    else
        disp('非恒定流')
    end
end




