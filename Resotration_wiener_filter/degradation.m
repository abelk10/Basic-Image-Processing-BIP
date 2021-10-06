function [y, h, n] = degradation(x)
    h = fspecial('motion',30,42);
    n = sqrt(0.001)*randn(size(x,1),size(x,2));
    y = imfilter(x,h,'replicate','same','conv');
    y = y + n;
end
