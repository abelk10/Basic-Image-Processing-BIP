function [O] = image_segmenter(I, k)
    S = reshape(I,size(I,1)*size(I,2),size(I,3));
    [LUT, M] = mykmeans(S, k);
    for i=1:size(S,1)
        r = LUT(i);
        S(i,:) = M(r,:);
    end
    O = reshape(S,size(I,1),size(I,2),size(I,3));
end
