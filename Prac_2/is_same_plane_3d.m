function is_same = is_same_plane_3d(A,B,C, d)
n = cross((B - A) ,( C - A));
if ( n(1) * (d(1) - A(1)) + n(2) * (d(2) - A(2)) + n(3) * (d(3) - A(3))) == 0 
    is_same = 1;
else 
    is_same = 0;
end

end

