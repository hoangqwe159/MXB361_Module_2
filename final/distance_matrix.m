function A = distance_matrix(set)
% Calculate distance matrix of a set of point
% Input
% set - set of vertices
A = squareform(pdist(set));

end



