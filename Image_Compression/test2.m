compressed{1} = [0 6];
compressed{2} = [0 1 1 2 1 1];
compressed{3} = [0 1 1 2 1 1];
compressed{4} = [0 6];
compressed{5} = [1 2 2 2];
compressed{6} = [0 1 4 1];
compressed{7} = [0 6];

test_image = lossless_decompress(compressed);
figure(1); imagesc(test_image); colormap gray; axis off equal;
title('Decompressed');