
clear;
clc;
se = strel('line',1,1);
obj=VideoReader('2020-02-03 13-23-45.mp4');
num=obj.NumberOfFrames;
for i=1:num
    frame=read(obj,i);
    frame=im2bw(frame,0.5);
    lunkuo=bwperim(frame);
    lunkuo=imdilate(lunkuo,se);

    lujing=strcat('E:\Video\TEST\',num2str(i));
    lujing=strcat(lujing,'.jpg');
    imwrite(lunkuo,lujing);
    close
end

clc;
 
WriterObj=VideoWriter('lunkuo.avi', 'Uncompressed AVI');
open(WriterObj);
for i=1:num
  pic='E:\Video\TEST\';
  pic=strcat(pic,num2str(i));
  ppic=strcat(pic,'.jpg');
  frame=imread(ppic);
  disp(ppic);
  writeVideo(WriterObj,frame);
end
close(WriterObj);