function [PAD] = pad_image(varargin)
    IMG = varargin{1};
    border_size = 10;
    if nargin == 2
        border_size = varargin{2};
    end
    % Show warning and convert image to grayscale if input image is RGB
    isGray = (size(IMG,3) == 1);
    if ~isGray
        warning('Input image must be grayscale');
        IMG = rgb2gray(IMG);
    end
    s = size(IMG);
    PAD = zeros(s(1)+2*border_size, s(2)+2*border_size, 'uint8');
    PAD(border_size+1:s(1)+border_size,border_size+1:s(2)+border_size) = IMG;
end