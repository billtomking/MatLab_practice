%场相关的图形绘制例子
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x , y] = meshgrid(-2:0.1:2,-2:0.1:2);
u=exp(x).*sin(y);
v=exp(y).*sin(x);

z=real((u.^2+v.^2)^0.5);

startx = -1:0.1:1;
starty = ones(size(startx));

quiver(x,y,u,v)
hold on
contour(x,y,z,100)



%%%%%%%%%%%%%%%%%%%%%%%
clear
close
clc
hold on
[x,y,z]=meshgrid(-10:0.5:10,-10:0.5:10,-10:0.5:10);
ux=x.^2-y.^2;
uy=2.*x.*y;
uz=-2.*z;

xmin = min(x(:));
xmax = max(x(:));
ymin = min(y(:));
ymax = max(y(:));
zmin = min(z(:));
zmax = max(z(:));
speed = sqrt(ux.^2 + uy.^2 + uz.^2);

[startx,starty,startz]=meshgrid([-10:2:0 0:1:10],[-10:2:0 0:1:10],-10:2:10);
[sx,sy,sz]=meshgrid(-10:2:10,-10:2:10,-10:2:10);
%quiver3(x,y,z,ux,uy,uz,1.2,'r')
%streamline(x,y,z,ux,uy,uz,startx,starty,startz)
%streamslice(x,y,z,ux,uy,uy,[],[],0)
%streamribbon(x,y,z,ux,uy,uz,sx,sy,sz,0.1);
coneplot(x,y,z,ux,uy,uz,sx,sy,sz,2)

%hsurfaces = slice(x,y,z,speed,[-10 0 10],0,0);
%set(hsurfaces,'FaceColor','interp','EdgeColor','none')

xlabel('x')
ylabel('y')
zlabel('z')

view(30,40)
daspect([1,1,1])


