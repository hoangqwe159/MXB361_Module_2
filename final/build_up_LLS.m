function X = build_up_LLS(d,dim)
% Build Up LLS algorithm
% Input
% d : distance matrix
% dim : the dimension of the data

% Find dim + 1 point not in the same plane
index = (1: dim);
point_index = find_point_dif_plane(d, dim);
index = [index point_index];

X = zeros(length(d), dim);

d_determined = d([1:dim, index(end)], [1:dim, index(end)]);
X([1:dim, index(end)], :) = svd_reconstruct(d_determined);

skip = index(end);

for j = dim+1:length(d)
    % Ax = b 
    % L x 3 * 3 x 1 = L x 1
    if j ~= skip        
        X = X';
        A = [];
        b = [];   
        
        % LLS
        for i = 1:length(index)-1
            A = [A; -2 * transpose(X(:,index(i+1)) - X(:, index(i)))]; 
            b = [b ; d( index(i+1), j)^2 - d(index(i), j)^2 - (norm(X(:,index(i+1))) ^ 2 - norm(X(:, index(i))) ^ 2)];
        end
        
        % Determine the next point
        x = inv(A' * A) * A' * b;
        X(:, j) = x;
        X = X';
        index = [index j];
    end
end  
end

