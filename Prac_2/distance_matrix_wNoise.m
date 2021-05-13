function d = distance_matrix_wNoise(d, theta)


for i = 1: length(d)
    for j = 1: length(d)
        d(i, j) = d(i, j) * (1 + 2 * theta * (0.5 - rand));
    end
end

end

