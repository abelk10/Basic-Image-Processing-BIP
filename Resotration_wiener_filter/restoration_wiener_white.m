function [x_tilde] = restoration_wiener_white(y, h, var_n)
    Y = fft2(y);
    var_x = var(y(:));
    NSPR = var_n/var_x;
    H = psf2otf(h,[size(Y,1), size(Y,2)]);
    R = conj(H)./(H.^2+NSPR);
    x_tilde = abs(ifft2(R.*Y));
end
