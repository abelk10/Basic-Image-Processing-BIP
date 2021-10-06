function [LUT, M] = step1_initialization(S, k)
    [m, n] = size(S);
    LUT = zeros(1,m);
    M = zeros(k,n);
    d = floor(m/k);
    for i=1:k
        %LUT(floor(m/k)*i:floor(m/k)*(i+1)) = i;
        M(i,:) = S((i-1)*d+1,:);
    end
end
