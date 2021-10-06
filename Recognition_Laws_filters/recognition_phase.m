function ClassMap = recognition_phase(I, MODEL)
    ClassMap = zeros(size(I,1), size(I,2));
    BB = zeros(size(I,1), size(I,2),9);
    N = ones(15)/(15*15);
    for i=1:9
        BB(:,:,i) = conv2(conv2(I, laws_kernel(i), 'same').^2, N, 'same');
    end
    sum_abs_diff = zeros(1,size(MODEL,1));
    for x=1:size(I,1)
        for y=1:size(I,2)
            for n=1:size(MODEL,1)
                sum_abs_diff(n) = sum(abs(reshape(squeeze(BB(x,y,:)),1,9)-MODEL(n,:)));
            end
            [val,idx] = min(sum_abs_diff);
            ClassMap(x,y) = idx;
        end
    end
end
