clear; close all;
im = imread('input/AlfredoBorba_TuscanLandscape.jpg');
imshow(im);
title('Original image');
isColor = (size(im,3) == 3);
gray = rgb2gray(im);
imshow(gray);
title('Grayscale');
imwrite(gray, 'output/AlfredoBorba_TuscanLandscape_GRAY.jpg');
