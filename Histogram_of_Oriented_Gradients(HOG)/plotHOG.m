function plotHOG(HOG, varargin)
%PlotHOG Visualizes a HOG feature matrix
%   This function visualizes a HOG feature matrix. The input matrix should
%   have size NxMx9. This function works with a fixed cell size 8. The
%   second (optional) parameter is a 'Color' property for plotting (green
%   as default). The function has no returning value.
%   v1.3 only diff: input size should be NxMx36
%
% By nasma1 @ v1.2 -- 2017.11.20.
%    kolmi  @ v1.3 -- 2018.12.03.

% Check HOG matrix:
% v1.3
if size(HOG,3) ~= 36
    error(['HOG matrix should be NxMx36, got ', num2str(size(HOG,1)),'x',...
           num2str(size(HOG,2)),'x',num2str(size(HOG,3)),' instead!']);
end


% Color of the plot
if nargin > 1
    PlotColor = varargin{1};
else
    PlotColor = 'g';
end

% Vector of orientation bin values:
OriBinVals = deg2rad(linspace(0,180,9)); % this is different from the binner, reason probably: matrix-image rotation in matlab

% Vector of X and Y feature cell centerpoints
% Note that the cellsize is fixed.
cellsize = 8;

X = floor(cellsize/2):cellsize:(size(HOG,2)*cellsize+ceil(cellsize/2));
Y = floor(cellsize/2):cellsize:(size(HOG,1)*cellsize+ceil(cellsize/2));

% Assuming a figure was opened:
hold on;

% For every angle bin: --- v1.3: we are dealing only with the top left
% corner of the block -> the first 9 value in the normalized descriptor
% belongs to the top left cell of the block
for ang=1:9
    % phi is the angle calculated from the bin index and the OriBinVals.
    % % v1.3: extension due to the bottom&right boundary cells
    phi = ones(size(HOG(:,:,1)) + [1 1])*OriBinVals(ang);
    
    % The 180-deg rotated 'other half' of the vector (since the 9 bin
    % version is unsigned we only have the directions in [-90, 90] deg.)
    % v1.3: [0, 180] deg. but the main reason has not changed
    phi_180 = phi + pi;
    
    % magnitude is the intensity value on the location at the specific layer
    % v1.3: extension due to the bottom&right boundary cells
    magnitude = [HOG(:,:,ang), HOG(:, end, ang+9); HOG(end, :, ang+18), HOG(end, end, ang+27)];
    
    % Vectors U and V (the positive part)
    U = sin(phi) .* magnitude;
    V = cos(phi) .* magnitude;    
    
    % Vectors U_180 and V_180 (the negative, complementer part)
    U_180 = sin(phi_180) .* magnitude;
    V_180 = cos(phi_180) .* magnitude;
    
    % Scaling factor: overrides the quiver's original scaling factor (default 0.9)
    % ==> the arrows are shorter and therefore they don't merge.
    sclf = 0.5;    
    
    % The actual plotting using quiver
    quiver(X, Y, U,     V,     'Color', PlotColor, 'AutoScaleFactor', sclf);
    quiver(X, Y, U_180, V_180, 'Color', PlotColor, 'AutoScaleFactor', sclf);

end % of for loop


% We don't need to hold the plots anymore, if the user want to preserve it
% they will use `hold on` again.
hold off;

end % of function