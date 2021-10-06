function [LUT, M] = mykmeans(S, k)
    [LUT, M_old] = step1_initialization(S, k);
    t = 1;
    e = 0.02;
    while t<100
        LUT = step2_assignment(S, k, LUT, M_old);
        M = step3_update(S, k, LUT, M_old);
        if sum(sum((M-M_old).^2)) < e
            break
        end
        M_old = M;
        t = t+1;
    end

    fprintf('Iteration finished after %d steps.\n', t);

end
