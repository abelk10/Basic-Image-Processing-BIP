close all;
clear; clc;

pHOG = load('input/pedestrian_sample.mat');
pHOG = pHOG.pedestrian_sample;

figure(2);
subplot(2,6,7); plotHOG(pHOG); title('Pedestrian HOG');
axis equal ij off;
    
for k=1:5
    I = imread(['./input/sample',num2str(k),'.png']);
    H = pmHOG_extractHOG(I);
    score = detectPedestrians(I, pHOG);
    subplot(2,6,k+1);   imshow(I); title(['Sample #', num2str(k)]);
    subplot(2,6,6+k+1); plotHOG(H); title(['Score: ', num2str(score)]);
    axis equal ij off;
    drawnow;
end