clear; close all; clc;
test_image = [
    0 0 0 0 0 0
    0 1 0 0 1 0
    0 1 0 0 1 0
    0 0 0 0 0 0
    1 1 0 0 1 1 
    0 1 1 1 1 0
    0 0 0 0 0 0
    ];

figure(1); imagesc(test_image); colormap gray; axis off equal;
title('Original');

compressed = lossless_compress(test_image);

fprintf('The compressed image is the following:\n');
for y=1:size(compressed)
    fprintf('compressed{%i} = [', y);
    for x=1:numel(compressed{y})-1
        fprintf('%i ',compressed{y}(x))
    end
    fprintf('%i]\n', compressed{y}(end))
end