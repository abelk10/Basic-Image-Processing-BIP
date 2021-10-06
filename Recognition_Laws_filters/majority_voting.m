function OUT = majority_voting(IN, w_dia)
    OUT = zeros(size(IN,1), size(IN,2));
    for x=1:w_dia:size(IN,1)
        for y=1:w_dia:size(IN,2)
            x_max = min(x+w_dia-1, size(IN,1));
            y_max = min(y+w_dia-1, size(IN,2));
            OUT(x:x_max,y:y_max) = mode(IN(x:x_max,y:y_max), 'all');
        end
    end
end
