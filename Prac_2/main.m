% [x,y,z] = hilbert3(2); 
% plot3(x,y,z)

x1 = [-1 -1 -1/2 0 0];
y1 = [0 1 1/2 1 0];
plot(x1, y1)

hold on
[x, y] = hilbert(2);
plot(x, y)
