function pine = find_the_pine(I)
    hsv = rgb2hsv(I);
    pine = squeeze(hsv(:,:,1))<.155;
end