function [x,y, z] = hilbert3(n)
%HILBERT Hilbert curve 3D.
%
% [x,y, z]=hilbert3(n) gives the vector coordinates of points
%   in n-th order Hilbert curve of area 1.

if nargin ~= 1
    n = 2;
end
if n <= 0
    x = 0;
    y = 0;
    z = 0;
else
    [xo,yo,zo] = hilbert3(n-1);
    x = .5*[.5+zo .5+yo -.5+yo -.5-xo -.5-xo -.5-yo .5-yo .5+zo];
    y = .5*[.5+xo .5+zo .5+zo .5+yo -.5+yo -.5-zo -.5-zo -.5-xo];
    z = .5*[.5+yo -.5+xo -.5+xo .5-zo .5-zo -.5+xo -.5+xo .5-yo];
end
