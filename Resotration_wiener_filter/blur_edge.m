function out_img = blur_edge(in_img)
    h = fspecial('gaussian',60,10);
    IN = fft2(in_img);
    H = psf2otf(h,[size(in_img,1), size(in_img,2)]);
    blurred_img = abs(ifft2(H.*IN));
    wm = ones(70,70);
    pad_wm = padarray(wm, [1,1]);
    wm2 = imresize(pad_wm, [size(in_img,1), size(in_img,2)], 'bilinear');
    out_img = wm2.*in_img + (1-wm2).*blurred_img;
end
