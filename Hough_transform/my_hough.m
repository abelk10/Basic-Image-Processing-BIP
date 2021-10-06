function [H] = my_hough(input_img)
    rmax = round(sqrt(size(input_img,1)^2 + size(input_img,2)^2));
    H = zeros(rmax, 180);
    for i=1:size(input_img,1)
        for j=1:size(input_img,2)
            for t=1:180
                if input_img(i,j) ~= 0
                    r = round(i*cosd(t) + j*sind(t));
                    if r > 0
                        H(r,t) = H(r,t) + 1;
                    end
                end
            end
        end
    end
end