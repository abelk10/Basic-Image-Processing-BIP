function LUT = step2_assignment(S, k, LUT, M)
    [m, ~] = size(S);
    d = zeros(1,k);
    for xi=1:m
        for mu_j=1:k
            d(mu_j) = sum((S(xi,:)-M(mu_j,:)).^2);
        end
        [~, idx] = min(d);
        LUT(xi) = idx;
    end
end
