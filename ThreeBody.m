clc
clear all
close
G=6.667E-11;
%n=input('次数');%10e6...
%t=input('dt');
n=1000000;
t=0.00001;
PL=[[0 0] ; [4 0] ; [2 2*3^0.5]];

v=[[0.1 0] ; [0 0.1] ; [0.1 0.1]];

M=[1e10 ; 1e10 ; 1e10];

R1=zeros(n,2);
R2=zeros(n,2);
R3=zeros(n,2);

V1=zeros(n,2);
V2=zeros(n,2);
V3=zeros(n,2);
T=t:t:t*n;

    figure(1);
    hold on
    plot(PL(:,1),PL(:,2),'bo')

for times=1:n
    
    DIS12=((PL(1,1)-PL(2,1))^2+(PL(1,2)-PL(2,2))^2)^0.5;
    DIS13=((PL(1,1)-PL(3,1))^2+(PL(1,2)-PL(3,2))^2)^0.5;
    DIS23=((PL(3,1)-PL(2,1))^2+(PL(3,2)-PL(2,2))^2)^0.5;  
    
    dF12=gravity(M(1),M(2),DIS12);
    dF13=gravity(M(1),M(3),DIS13);
    dF23=gravity(M(3),M(2),DIS23);

    f12x=(PL(2,1)-PL(1,1))/DIS12*dF12;
    f12y=(PL(2,2)-PL(1,2))/DIS12*dF12;
    f13x=(PL(3,1)-PL(1,1))/DIS13*dF13;
    f13y=(PL(3,2)-PL(1,2))/DIS13*dF13;
    f23x=(PL(3,1)-PL(2,1))/DIS23*dF23;
    f23y=(PL(3,2)-PL(2,2))/DIS23*dF23;

    f1x=f12x+f13x;
    f1y=f12y+f13y;
    f2x=-f12x+f23x;
    f2y=-f12y+f23y;
    f3x=-f23x-f13x;
    f3y=-f23y-f13y;

    a1x=f1x / M(1);
    a1y=f1y / M(1);
    a2x=f2x / M(2);
    a2y=f2y / M(2);
    a3x=f3x / M(3);
    a3y=f3y / M(3);
    
    v(1,:)=v(1,:)+[a1x a1y].*t;
    v(2,:)=v(2,:)+[a2x a2y].*t;
    v(3,:)=v(3,:)+[a3x a3y].*t;
    
    PL(1,:)=PL(1,:)+v(1,:).*t;
    PL(2,:)=PL(2,:)+v(2,:).*t;
    PL(3,:)=PL(3,:)+v(3,:).*t;
    
    R1(times,:)=PL(1,:);
    R2(times,:)=PL(2,:);
    R3(times,:)=PL(3,:);
    
    V1(times,:)=v(1,:);
    V2(times,:)=v(2,:);
    V3(times,:)=v(3,:);
    

end



    plot(R1(:,1),R1(:,2),'r--');
    plot(R2(:,1),R2(:,2),'b-.');
    plot(R3(:,1),R3(:,2),'g-');
    figure(2);
    subplot(3,2,1),plot(R1(:,1),R1(:,2),'r--');
    subplot(3,2,3),plot(R2(:,1),R2(:,2),'b-.');
    subplot(3,2,5),plot(R3(:,1),R3(:,2),'g-');
    X=((V1(:,1).^2+V1(:,2).^2).^0.5);
    Y=((V2(:,1).^2+V2(:,2).^2).^0.5);
    Z=((V3(:,1).^2+V3(:,2).^2).^0.5);
    subplot(3,2,2),plot(T,X,'r--')
    subplot(3,2,4),plot(T,Y,'b-.')
    subplot(3,2,6),plot(T,Z,'g-') 
function f = gravity(m1,m2,r)
    G=6.667E-11;
    f=(G*m1*m2)/(r^2);
end