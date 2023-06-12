function a = hilbert_plot(n)
% Plot the n-th order Hilbert Curve

a = 0;
[x, y] = hilbert(n);
plot(x, y);
end

