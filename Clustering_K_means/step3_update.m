function M = step3_update(S, k, LUT, M)
    for i=1:k
        M(i,:) = mean(S(LUT == i,:),1);
    end
end
