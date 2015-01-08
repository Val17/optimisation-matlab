function y = Rosenbrock(x)

X = x(1);
Y = x(2);
y = 6.*sqrt((X.^2 + Y.^2)) + 4.*sqrt((X-2).^2 + (Y-1).^2) + 3.*sqrt((X-2).^2 + (Y-2).^2) + 5.*sqrt((X-1).^2 + (Y-3).^2);

end