clear; clc;
rng(8);
noncmprsd = rgb2gray(imread('input/AlfredoBorba_TuscanLandscape.jpg'));

%%%% PLAY WITH THESE %%%%
block_size = 8;
k = 50;
%%%%%%%%%%%%%%%%%%%%%%%%%

compressd = lossy_compress(noncmprsd, block_size, k);
decmprssd = lossy_decompress(compressd);

stats(3) = numel(noncmprsd)*8;
stats(1) = numel(decmprssd)*8;
stats(2) = numel(compressd.LUT)*8 + numel(compressd.DICT)*8 + 32 + 32;

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

%{
figure(2);
bs = [ 8  8  8 16 16 16 32 32 32];
kk = [10 25 50 10 25 50 10 25 50];
for p=1:9
    subplot(3,3,p);
    [LUT, M, imgcutsize] = lossy_compress(noncmprsd, bs(p), kk(p));
    decmprssd = lossy_decompress(LUT, M, imgcutsize);
    imagesc(decmprssd); axis equal off; colormap gray;
    title([num2str(bs(p)),'×',num2str(bs(p)),' w/ ',num2str(kk(p))]);
end
%}
