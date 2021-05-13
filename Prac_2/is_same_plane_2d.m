function is_same = is_same_plane_2d(A,B,c)

n = [A(2) - B(2), B(1) - A(1)];

if ( n(1) * (c(1) - A(1)) + n(2) * (c(2) - A(2))) == 0 
    is_same = 1;
else 
    is_same = 0;
end

end

