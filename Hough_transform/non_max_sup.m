function [r_vect, t_vect] = non_max_sup(A, k, p)
    r_vect = zeros(1,k);
    t_vect = zeros(1,k);
    i = 1;
    while k>0
        [val, idx] = max(A(:));
        [r, t] = ind2sub(size(A), idx);
        r_vect(i) = r;
        t_vect(i) = t;
        x1 = max(1,r-p);
        x2 = min(size(A,1),r+p);
        y1 = max(1,t-p);
        y2 = min(size(A,2),t+p);
        A(x1:x2,y1:y2) = 0;
        k = k-1;
        i = i+1;
    end
end