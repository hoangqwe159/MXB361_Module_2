function max_norm = find_max_norm(X, X_noise)

max_norm = 0;
for i= 1:length(X)
    temp = norm(X(i,:) - X_noise(i, :));
    if temp > max_norm
        max_norm = temp;
    end
end
end

