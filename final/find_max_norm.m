function max_norm = find_max_norm(X, X_noise)
% Find max norm between two set of vertices
% Input
% X, X_noise: two set of vertices

max_norm = 0;
for i= 1:length(X)
    temp = norm(X(i,:) - X_noise(i, :));
    if temp > max_norm
        max_norm = temp;
    end
end
end

