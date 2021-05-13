function index = find_point_dif_plane(d, dim)

index = 0;
if dim == 3
    for i = dim+1:length(d)
        temp = d([1:3, i], [1:3, i]);

        d12 = temp(1, 2);
        d13 = temp(1, 3);
        d14 = temp(1, 4);
        d23 = temp(2,3);
        d24 = temp(2, 4);
        d34 = temp(3, 4);

        % 1 2 3
        s1 = (d12 + d23 + d13) / 2;
        A1 = sqrt(s1 * (s1 - d12) * (s1 - d23) * (s1 - d13));

        % 1 2 4
        s2 = (d12 + d24 + d14) / 2;
        A2 = sqrt(s2 * (s2 - d12) * (s2 - d24) * (s2 - d14));

        % 1 3 4
        s3 = (d13 + d34 + d14) / 2;
        A3 = sqrt(s3 * (s3 - d13) * (s3 - d34) * (s3 - d14));

        % 2 3 4
        s4 = (d23 + d24 + d34) / 2;
        A4 = sqrt(s4 * (s4 - d23) * (s4 - d24) * (s4 - d34));

        tolerance = 0.000001;
        if ~((abs((A1 + A2) -(A3 + A4)) <= tolerance) || (abs((A1 + A3) - (A2 + A4)) <= tolerance) || (abs((A1 + A4) - (A2 + A3)) <= tolerance))
           index = i;
           break
        end
    end
elseif dim == 2
    for i = dim+1:length(d)
        temp = d([1:dim, i], [1:dim, i]);

        d12 = temp(1, 2);
        d13 = temp(1, 3);
        d23 = temp(2,3);


        tolerance = 0.000001;
        if ~((abs((d12 + d13) -d23) <= tolerance) || (abs(d12 + d23 - d13) <= tolerance) || (abs(d13 + d23 - d12) <= tolerance))
           index = i;
           break
        end
    end
end


end

