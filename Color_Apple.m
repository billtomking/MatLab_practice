clear;
clc;
cd('E:\Video\TEST')
se = strel('line',1,1);
obj=VideoReader('Bad Apple.mp4');%适时修改

num=obj.NumberOfFrames;%调试时注意修改
%num=100;%调试用
for i=1:num
    frame=read(obj,i);
    le=graythresh(frame);
    frame=im2bw(frame,le*0.25);
    
    R=zeros(size(frame,1),size(frame,2));
    G=zeros(size(frame,1),size(frame,2));
    B=zeros(size(frame,1),size(frame,2));
    RGB=zeros(size(frame,1),size(frame,2),3);
    %R=uint8(R);
    %G=uint8(G);
    %B=uint8(B);
    %RGB=uint8(RGB);
    RanR=rand;
    RanG=rand;
    RanB=rand;
    
    for I=1:size(frame,1)
        for J=1:size(frame,2)
            if(frame(I,J)==1)
                R(I,J)=RanR;
                G(I,J)=RanG;
                B(I,J)=RanB;
            else
                R(I,J)=1-RanR;
                G(I,J)=1-RanG;
                B(I,J)=1-RanB;
            end
        end
    end
    RGB(:,:,1)=R;
    RGB(:,:,2)=G;
    RGB(:,:,3)=B;
    %RGB=uint8(RGB);
    %lunkuo=imdilate(lunkuo,se);
    %imshow(lunkuo);
    %生成帧图，路径可自由修改
    %若将下面三行注释符号去掉，程序将自动把每帧图片保存到本地，
    lujing=strcat('E:\Video\TEST\',num2str(i));
    lujing=strcat(lujing,'.jpg');
    imwrite(RGB,lujing);
    close
end
%createavi.m
%此程序是将刚才保存到本地的帧图合称为一个完整的视频

clc;


WriterObj=VideoWriter('lunkuo.mp4', 'MPEG-4');
open(WriterObj);
for i=1:num
  pic='E:\Video\TEST\';%存放帧图的路径
  pic=strcat(pic,num2str(i));
  ppic=strcat(pic,'.jpg');
  frame=imread(ppic);% 读取图像，放在变量frame中
  disp(ppic);
  writeVideo(WriterObj,frame);% 将frame放到变量WriterObj中
end
close(WriterObj);
