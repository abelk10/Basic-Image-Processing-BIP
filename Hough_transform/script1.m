I = imread('input/lines.png');
I = mat2gray(I);
H = my_hough(I);


figure(1);
subplot(121); 
    imshow(I);
    title('Original image');
subplot(122); 
    h = imagesc(H);
    set(h, 'XData', [1,180]);
    title('Hough space');
    xlim([1,180]); xlabel('\theta');
    ylabel('r');
    axis ij;