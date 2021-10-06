function [TH] = threshold(IMG, level)
    TH = IMG;
    % Show warning and convert image to grayscale if input image is RGB
    isGray = (size(IMG,3) == 1);
    if ~isGray
        warning('Input image must be grayscale');
        TH = rgb2gray(IMG);
    end
    TH(TH<level) = 0;
    TH(TH>=level) = 255;
end