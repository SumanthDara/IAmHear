clc;
close all
clear all
warning off
cam=webcam;
load IAmHear;
x=0;
y=0;
height=800;
width=800;
box=[x y height width];
while true
    picture=cam.snapshot;
    Focus = insertObjectAnnotation(picture,'rectangle',box,'Eye Box');
    eyes=imcrop(picture,box);
    eyes=imresize(eyes,[227,227]);
    label=classify(IAmHear,eyes);
    imshow(Focus);
    title(char(label));
    drawnow;
end