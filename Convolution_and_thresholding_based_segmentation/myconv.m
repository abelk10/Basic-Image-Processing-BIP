function output_img = myconv(input_img, kernel)
    k_dim = size(kernel);
    padded = padarray(input_img, [(k_dim(1)-1)/2,(k_dim(2)-1)/2]);
    k_rot = rot90(kernel, 2);
    output_img = zeros(size(input_img, 1), size(input_img, 2));
    for i = 1:size(input_img,1)
        for j = 1:size(input_img,2)
            output_img(i,j) = sum(padded(i:i+k_dim(1)-1,j:j+k_dim(2)-1) .* k_rot, 'all');
        end
    end
end
