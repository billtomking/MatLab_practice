clc
clear
close
P0=2148;%打印机价格=P0
M0=2.3;%打印机自带墨=M0

P1=199;%打印机墨水价=P1
C1=5000;%单位墨水产出C1

P2=118+65;%单位纸张价格P2
C2=2500;%单位纸张量C2

P3=479;%成像鼓价=P3
C3=20000;%成像鼓产=C3

p=500;%打印机转手价格p


M1=0;%墨盒购买=M1
M2=0;%纸张购买=M2
M3=0;%成像鼓购买量=M3
EX=4000:10:100000;%预计打印量EX
s=zeros(1,size(EX,2));%单位价格s
S=zeros(1,size(EX,2));
leng=size(EX,2);

for i=1:leng
    M1=ceil(EX(i)/C1-M0);
    if M1<0
        M1=0;
    end
    M2=ceil(EX(i)/C2);
    M3=ceil(EX(i)/C3-1);
    S(i)=P0+M1*P1+M2*P2+M3*P3-p;%总价格S
    s(i)=S(i)/EX(i);
end

for i=1:leng
    if s(i)<0.4
        disp('0.4分界???')
        disp(EX(i))
        break
    end
end
for i=1:leng
    if s(i)<0.3
        disp('0.3分界???')
        disp(EX(i))
        break
    end
end
for i=1:leng
    if s(i)<0.2
        disp('0.2分界=')
        disp(EX(i))
        break
    end
end
figure(1)
hold on
grid on
plot(EX,s,'b-')
plot([0,100000],[0.2,0.2],'r--')
plot([0,100000],[0.3,0.3],'r--')
plot([0,100000],[0.4,0.4],'r--')
xlabel('打印')
ylabel('单张价格')

figure(2)
hold on
grid on
plot(EX,S,'b-')
xlabel('打印')
ylabel('总价')