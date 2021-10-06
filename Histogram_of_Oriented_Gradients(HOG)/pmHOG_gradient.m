function [PHI, MAG] = pmHOG_gradient(I)
    dI = double(I);
    Hx = [-1 0 1];
    Hy = [-1 0 1]';
    X = imfilter(dI,Hx,'replicate','same');
    Y = imfilter(dI,Hy,'replicate','same');
    PHI = rad2deg(atan(Y./X));
    MAG = sqrt(X.^2+Y.^2);
    
end
