% Get distance of consecutive turning points
path = diag(distance_matrix(1), 1);

% Calculate the order
n = log2(0.5 / path(1)) + 1;

% Find the first point
x = zeros(1, length(path) + 1);
y = zeros(1, length(path) + 1);

x(1) = -(2^n - 1) / (2^(n+1));
y(1) = x(1);

sign_array = [1 1 -1];

for i=1:length(path)
    index = mod(i, 13);
    if index == 0
        index = 13;
    end
    	       
    if (mod(i, 2) == 0)
        x(i + 1) = x(i) + sign_array(index) * path(i);
        y(i + 1) = y(i);
    else
        x(i + 1) = x(i) ;
        y(i + 1) = y(i) + sign_array(index) * path(i);
    end  	    	
end

plot(x, y)