function [x_tilde] = restoration_CLS(y, h, alpha, c)
    Y = fft2(y);
    H = psf2otf(h,[size(Y,1), size(Y,2)]);
    C = psf2otf(c,[size(Y,1), size(Y,2)]);
    R = conj(H)./(H.^2+alpha*C.^2);
    x_tilde = abs(ifft2(R.*Y));
end
