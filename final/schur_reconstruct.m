function X = schur_reconstruct(d)
    
% Length of  distance matrix
n = length(d);

% Calculate M = X * transpose(X)
% M = (m(i,j) for i,j = 1, ... n-1))
M = zeros(n, n);

% Schur method to reconstruct coordinates
for i = 1:n
    for j = 1:n
        M(i, j) = (d(i, n) ^ 2 - d(i, j) ^ 2 + d(j, n) ^ 2)/2;
    end
end

[Q, T] = schur(M);
X = Q * sqrt(T);
index = find(diag(T) > 0.001);
empty = [];

for i = 1:length(index)
    empty =[empty X(:, index(i))];
end
X = empty;

end



