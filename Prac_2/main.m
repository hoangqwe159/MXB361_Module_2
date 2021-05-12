set_1 = [ -1 0; -1 1; -1/2 1/2; 0 1; 0 0];



%d = distance_matrix(set_1);
d = distance_matrix_hilbert(7, 2);
% 3 points that are not in same plane
d_determined = d(1:3, 1:3);
l = 3;

X = svd_reconstruct(d_determined)

for j = 4:length(d)
    % Ax = b 
    % L x 2 * 2 x 1 = L x 1
    X = X';
    A = [];
    b = [];
    for i = 1:l-1
        A = [A; -2 * transpose(X(:, i+1) - X(:, i))]; 
        b = [b ; d(i+1, j)^2 - d(i, j)^2 - (norm(X(:, i+1)) ^ 2 - norm(X(:, i)) ^ 2)];
    end

    x = inv(A' * A) * A' * b;
    X = [X x];
    X = X';
    l = l +1;
end

plot(X(:,1), X(:, 2))