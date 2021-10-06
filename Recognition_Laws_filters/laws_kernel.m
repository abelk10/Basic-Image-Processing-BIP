function H = laws_kernel(k)
    if k<1 || k>9
        error('Nubmer of kernels must be between 1 and 9');
    end
    L = [1 2 1]'/6;
    E = [1 0 -1]'/2;
    S = [1 -2 1]'/2;
    K = cat(3, L*L', L*E', L*S', E*L', E*E', E*S', S*L', S*E', S*S');
    H = K(:,:,k);
end
