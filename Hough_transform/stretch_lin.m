function output_img = stretch_lin(input_img)
    xmax = max(input_img, [], 'all');
    xmin = min(input_img, [], 'all');
    output_img = uint8(round(255/double(xmax-xmin)*(input_img-xmin)));
end