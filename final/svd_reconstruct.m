function X = svd_reconstruct(d)
% SVD method to reconstruct points from distance matrix
% Input
% d : distance matrix

% Length of  distance matrix
n = length(d);

% Calculate M = X * transpose(X)
% M = (m(i,j) for i,j = 1, ... n-1))
M = zeros(n, n);

% SVD method to reconstruct coordinates
for i = 1:n
    for j = 1:n
        M(i, j) = (d(i, n) ^ 2 - d(i, j) ^ 2 + d(j, n) ^ 2)/2;
    end
end

[U, S, V] = svd(M);
index = find(diag(S) > 0.000001);
X = U * sqrt(S);
empty = [];

for i = 1:length(index)
    empty =[empty X(:, index(i))];
end
X = empty;

end

