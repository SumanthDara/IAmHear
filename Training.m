clc;
clear all
close all
warning off
n=alexnet;
layers=n.Layers;
layers(23)=fullyConnectedLayer(25);
layers(25)=classificationLayer;
dataImages=imageDatastore('Hand Dataset','IncludeSubfolders',true,'LabelSource','foldernames');
opts=trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64);
IAmHear=trainNetwork(dataImages,layers,opts);
save IAmHear;