clear; close all;
im = imread('input/AlfredoBorba_TuscanLandscape.jpg');
[ver, hor, rot] = flip_and_rotate(im);
subplot(1,3,1);
imshow(ver);
subplot(1,3,2);
imshow(hor);
subplot(1,3,3);
imshow(rot);