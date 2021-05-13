function d = hilbert_length(n)
%hilbert_length Calcaulate the length of n-th order curve

[x , y] = hilbert(n);
d = 0;
for n = 1:length(x)-1
    d = d + distance(x(n),y(n),x(n+1),y(n+1));    
end
end

