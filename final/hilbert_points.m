function p = hilbert_points(n)
% Calculate total number of points in n-th order 
% Hilbert Curve

[x, y] = hilbert(n);
p = 2; %start and end points
for n = 2:length(x)-1
    if ~((x(n) == x(n-1) && x(n) == x(n+1))  || (y(n) == y(n-1) && y(n)== y(n+1))) 
        p = p + 1;
    end
end
end

