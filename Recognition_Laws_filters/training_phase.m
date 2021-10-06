function MODEL = training_phase(T_cell)
    N = length(T_cell);
    MODEL = zeros(N, 9);
    for i=1:N
        [h, w] = size(T_cell{i});
        for j=1:9
            MODEL(i,j) = sum((conv2(T_cell{i}, laws_kernel(j), 'same')).^2, 'all')/(h*w);
        end
    end
end
