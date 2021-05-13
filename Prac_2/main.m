set_1 = [ -1 0; -1 1; -1/2 1/2; 0 1; 0 0];
set_3 = [ 0 0 1; 0 1 1; -1/2 1/2 1; -1 1 1; -1 0 1; -1 0 0; -1 1 0; -1/2 1/2 0; 0 1 0; 0 0 0];

dim = 2;

if dim == 3
    index = [1 2 3];
    point_index = find_point_dif_plane(d, dim);
    index = [index point_index];
    
    X = zeros(length(d), dim);
    
    d_determined = d([1:dim, index(end)], [1:dim, index(end)]);
    X([1:3, index(end)], :) = svd_reconstruct(d_determined);

    skip = index(end);

    for j = dim+1:length(d)
        % Ax = b 
        % L x 3 * 3 x 1 = L x 1
        if j ~= skip        
            X = X';
            A = [];
            b = [];   

            for i = 1:length(index)-1
                A = [A; -2 * transpose(X(:,index(i+1)) - X(:, index(i)))]; 
                b = [b ; d( index(i+1), j)^2 - d(index(i), j)^2 - (norm(X(:,index(i+1))) ^ 2 - norm(X(:, index(i))) ^ 2)];
            end
            
            x = inv(A' * A) * A' * b;
            X(:, j) = x;
            X = X';
            index = [index j];
        end
    end
    plot3(X(:,1), X(:, 2), X(:,3))
elseif dim == 2

    index = [1 2];
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

            for i = 1:length(index)-1
                A = [A; -2 * transpose(X(:,index(i+1)) - X(:, index(i)))]; 
                b = [b ; d( index(i+1), j)^2 - d(index(i), j)^2 - (norm(X(:,index(i+1))) ^ 2 - norm(X(:, index(i))) ^ 2)];
            end
            
            x = inv(A' * A) * A' * b;
            X(:, j) = x;
            X = X';
            index = [index j];
        end
    end
    plot(X(:,1), X(:,2));
    
    
    
    
    
    
    
    
    %______________________________________
%     d = distance_matrix(set_1);    
%     d_determined = d(1:3, 1:3);
%     X = svd_reconstruct(d_determined);
% 
%     index = 0;
%     for i = 4:length(set_3)
%         if is_same_plane_3d(set_3(1), set_3(2), set_3(3), set_3(i)) == 0
%             index = i;
%         end    
%     end
% 
%     d_determined = d([1:3, index], [1:3, index]);
%     X = svd_reconstruct(d_determined);
% 
%     %l = 3;
%     l = 4;
% 
% 
%     for j = dim+1:length(d)
%         % Ax = b 
%         % L x 2 * 2 x 1 = L x 1
%         if j ~= index        
%             X = X';
%             A = [];
%             b = [];
%             disp("X la")
%             disp(X)
%             for i = 1:l-1
% 
%                 A = [A; -2 * transpose(X(:, i+1) - X(:, i))]; 
%                 b = [b ; d(i+1, j)^2 - d(i, j)^2 - (norm(X(:, i+1)) ^ 2 - norm(X(:, i)) ^ 2)];
%             end
% 
% 
%             x = inv(A' * A) * A' * b;
%             X = [X x];
%             X = X';
%             l = l +1;
%         end
%     end
end


