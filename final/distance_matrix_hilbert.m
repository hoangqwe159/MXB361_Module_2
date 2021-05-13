function A = distance_matrix_hilbert(n, dim)
%distance_matrix Distance matrix of all turning points
if (dim == 2)
    [x, y] = hilbert(n);
    x_temp = x(1);
    y_temp = y(1);


    for n = 2:length(x)-1
        if ~((x(n) == x(n-1) && x(n) == x(n+1))  || (y(n) == y(n-1) && y(n)== y(n+1))) 
            x_temp = [x_temp, x(n)];
            y_temp = [y_temp, y(n)];
        end
    end

    x_temp = [x_temp, x(length(x))];
    y_temp = [y_temp, y(length(x))];

    A = [x_temp;y_temp];
    A = squareform(pdist(A'));
elseif (dim == 3)
    [x, y, z] = hilbert3(n);
    x_temp = x(1);
    y_temp = y(1);
    z_temp = z(1);


    for n = 2:length(x)-1
        if (x(n) == x(n-1) && x(n) == x(n+1))  + (y(n) == y(n-1) && y(n)== y(n+1)) + (z(n) == z(n-1) && z(n)== z(n+1)) < 2 
            x_temp = [x_temp, x(n)];
            y_temp = [y_temp, y(n)];
            z_temp = [z_temp, z(n)];
        end
    end

    x_temp = [x_temp, x(length(x))];
    y_temp = [y_temp, y(length(x))];
    z_temp = [z_temp, z(length(x))];

    A = [x_temp;y_temp;z_temp];
    A = squareform(pdist(A')); 
end
    

end



