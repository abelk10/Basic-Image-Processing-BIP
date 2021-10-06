function hist_vector = calc_hist_vector(input_img)
   hist_vector = zeros(1,256);
   for i=1:size(input_img,1)
       for j=1:size(input_img,2)
           val = input_img(i,j);
           hist_vector(val+1) = hist_vector(val+1) + 1;
       end
   end
end