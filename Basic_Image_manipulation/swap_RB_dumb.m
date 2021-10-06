function [BGR] = swap_RB_dump(RGB)
    BGR = RGB;
    s = size(RGB);
    for i = 1:s(1)
        for j = 1:s(2)
            BGR(i,j,1) = RGB(i,j,3);
            BGR(i,j,3) = RGB(i,j,1);
        end
    end
end