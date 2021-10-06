close all;
clear; clc;

%I = imread('./input/gt.png');
I = imread('./input/sample1.png');

H = pmHOG_extractHOG(I);

figure;
imshow(I, 'InitialMagnification', 'fit');
hold on;
plotHOG(H);
