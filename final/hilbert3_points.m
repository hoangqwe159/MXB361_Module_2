function p = hilbert3_points(n)
%hilbert3_points Calculate total number of turning points in n-th order 
% Hilbert Curve 3D

[x, y, z] = hilbert3(n);
p = 2; %start and end points
for n = 2:length(x)-1
    
    if (x(n) == x(n-1) && x(n) == x(n+1))  + (y(n) == y(n-1) && y(n)== y(n+1)) + (z(n) == z(n-1) && z(n)== z(n+1)) < 2 
        p = p + 1;
        
    end
end
end
