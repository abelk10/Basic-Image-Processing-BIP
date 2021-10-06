clear; close all;
im = imread('input/AlfredoBorba_TuscanLandscape.jpg');
gray = rgb2gray(im);
row = 150;
s = size(gray);
subplot(2,1,1);
imshow(gray);
% plot a horizontal line at the specifed row
hold on
x = (1:1:s(2));
plot(x, row+x*0, 'r', 'LineWidth', 2);
subplot(2,1,2);
% grab the intesity values at the specified row
y = gray(row,:);
plot(x, y, 'r', 'LineWidth', 2);
xlabel('column index');
ylabel('pixel intesity value');