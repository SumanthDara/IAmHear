clc
clear all
close all
warning off
c=webcam;
x=0;
y=0;
height=800;
width=800;
box=[x y height width];
temp=0;
while temp<=100
    picture=c.snapshot;
    Focus = insertObjectAnnotation(picture,'rectangle',box,'Eye Box');   
imshow(Focus);
filename=strcat(num2str(temp),'.bmp');
eyes=imcrop(picture,box);
eyes=imresize(eyes,[227 227]);
    imwrite(eyes,filename);
    temp=temp+1;
    drawnow;
end
clear c;