function A = distance_matrix(n)
%distance_matrix Distance matrix of all turning points
[x, y] = hilbert(n);


x_temp = y(1);
y_temp = y(1);

p = 2;
for n = 2:length(x)-1
    if ~((x(n) == x(n-1) && x(n) == x(n+1))  || (y(n) == y(n-1) && y(n)== y(n+1))) 
        p = p + 1;
        x_temp = [x_temp, x(n)];
        y_temp = [y_temp, y(n)];
    end
end

x_temp = [x_temp, x(length(x))];
y_temp = [y_temp, y(length(x))];

A = [x_temp;y_temp];
A = squareform(pdist(A'));

end

% visualising data genomic space filln

