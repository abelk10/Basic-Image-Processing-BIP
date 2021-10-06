function [P, M] = fourier_parts(F)
    shifted = fftshift(F);
    P = angle(shifted);
    M = abs(shifted);
end
