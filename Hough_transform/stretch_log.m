function output_img = stretch_log(input_img, c)
    output_img = c*log(double(input_img+1));
    xmax = max(output_img, [], 'all');
    xmin = min(output_img, [], 'all');
    output_img = uint8(round(255/double(xmax-xmin)*(output_img-xmin)));
end