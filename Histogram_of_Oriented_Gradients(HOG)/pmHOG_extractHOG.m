function norm_HOG = pmHOG_extractHOG(I)
    h = size(I,1)/8;
    w = size(I,2)/8;
    norm_HOG = zeros(h-1,w-1,36);
    for i=1:h-1
        for j=1:w-1
            block = I(8*(i-1)+1:8*(i+1),8*(j-1)+1:8*(j+1));
            blur = imgaussfilt(block,0.1);
            feature_vector = [];
            for k=1:2
                for l=1:2
                    cell_ = blur(8*(k-1)+1:8*k,8*(l-1)+1:8*l);
                    [PHI,MAG] = pmHOG_gradient(cell_);
                    H = pmHOG_binner(PHI, MAG);
                    feature_vector = [feature_vector H];
                end
            end
            feature_vector = feature_vector/sum(feature_vector);
            norm_HOG(i,j,:) = feature_vector;
        end
    end
end
