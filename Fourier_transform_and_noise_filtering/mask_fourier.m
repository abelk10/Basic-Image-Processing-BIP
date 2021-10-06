function newF = mask_fourier(F, x, y, r)
    shifted = fftshift(F);
    for k=1:length(x)
        x1 = max(1,x(k)-r);
        x2 = min(size(F,1),x(k)+r);
        y1 = max(1,y(k)-r);
        y2 = min(size(F,2),y(k)+r);
        shifted(y1:y2,x1:x2) = 0+0i;
    end
    newF = ifftshift(shifted);
end
