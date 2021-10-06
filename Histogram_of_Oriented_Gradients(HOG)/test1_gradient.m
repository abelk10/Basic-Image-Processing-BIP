close all;
clear; clc;

%{
T = rand(10, 8);
TT = T;
TT(T>0.5) = 1;
TT(T<=0.5) = 0;
TT = uint8(TT.*255);
figure;
imshow(TT, 'InitialMagnification', 'fit');
%}

TT = [0     0     0     0     0     0   255     0;
   255     0   255     0   255   255   255     0;
   255   255     0     0     0     0     0   255;
   255   255   255   255   255     0   255   255;
   255   255     0     0   255     0     0     0;
     0     0   255   255   255     0     0     0;
   255   255     0   255     0   255     0     0;
   255     0   255   255     0   255     0   255;
     0     0   255     0     0   255     0     0;
   255     0   255     0   255     0     0     0];
TT = uint8(TT);

[PHI, MAG] = pmHOG_gradient(TT);

assert(isequal(size(PHI), size(TT)), 'Incorrect size of angle-matrix (PHI)');
assert(isequal(size(MAG), size(TT)), 'Incorrect size of magnitude-matrix (MAG)');

a = rem(PHI, 45);
assert(isempty(find(~isnan(a) & a~=0, 1)), 'The calculated angle-matrix (PHI) maybe not correct');

fprintf('Elementary check of your function pmHOG_gradient has passed\n');
