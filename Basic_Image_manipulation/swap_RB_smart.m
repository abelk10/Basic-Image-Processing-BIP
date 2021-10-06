function [BGR] = swap_RB_smart(RGB)
    BGR = RGB;
    BGR(:,:,1) = RGB(:,:,3);
    BGR(:,:,3) = RGB(:,:,1);
end