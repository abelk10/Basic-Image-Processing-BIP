clear; clc;
noncmprsd = imread('input/xkcd.png') > 150;

cmpressed = lossless_compress(noncmprsd);
decmprssd = lossless_decompress(cmpressed);

stats(3) = numel(noncmprsd);
stats(1) = numel(decmprssd);
stats(2) = 0;
for n=1:size(cmpressed)
    stats(2) = stats(2) + 1 + (numel(cmpressed{n})-1) * 8;
end


figure(1);
subplot(3,2,[1,3]);
imagesc(noncmprsd); axis equal off; colormap gray;
title({'Original image'; ['Size: ', num2str(stats(3)) , ' bits']});

subplot(3,2,[2,4]);
imagesc(decmprssd); axis equal off; colormap gray;
title({'Decompressed image'; ['Size: ', num2str(stats(1)) , ' bits']});

subplot(3,2,[5,6]);
barh(stats);
title({'Statistics', ['Compression ratio: ', num2str(stats(1)/stats(2))]});
xlabel('Size of the data in bits');
yticklabels({'decompressed', 'compressed', 'original'});