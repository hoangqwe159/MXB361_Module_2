function [x, y] = hilbert_reconstruct(A)
%hilbert_reconstruct Reconstruct the hibert curve based on A distance
%
matrix


path = diag(A, 1); 
n = log2(0.5 / path(1)) + 1;
x = zeros(1, length(path) + 1);
y = zeros(1, length(path) + 1);

x(1) = -(2^n - 1) / (2^(n+1));
y(1) = x(1);

sign_array = [1 1 -1 1 1 -1 1 1 1 -1 -1 -1 1];
    offset = 0;

%1 2 3 4 5 6
%+x +y -x +y +x- y + + + - - - +
for i=1:length(path)
    if (mod(i, 13) == 0) && (mod(i/13, 3) == 0)
        sign_array = -1 * [1 1 -1 1 1 -1 1 1 1 -1 -1 -1 1];
    elseif (mod(i, 13) == 0) && (mod(i/13, 3) ~= 0)
        sign_array = [1 1 -1 1 1 -1 1 1 1 -1 -1 -1 1];
    end 
    if (mod(i, 13) == 0) && (mod(i/13, 2) == 0)
        offset = offset + 1;
    end        
    index = mod(mod(i, 13) + offset, 13);
    if index == 0
        index = 13;
    end
    if (mod(n, 2) == 0) 
        disp(i);
        disp(index);
        if (mod(i, 2) == 1)   
            x(i + 1) = x(i) + sign_array(index) * path(i);
            y(i + 1) = y(i);
        else
            x(i + 1) = x(i) ;
            y(i + 1) = y(i) + sign_array(index) * path(i);
        end
    else 
        
        if (mod(i, 2) == 0)
            x(i + 1) = x(i) + sign_array(index) * path(i);
            y(i + 1) = y(i);
        else
            x(i + 1) = x(i) ;
            y(i + 1) = y(i) + sign_array(index) * path(i);
        end
    end
end

end

