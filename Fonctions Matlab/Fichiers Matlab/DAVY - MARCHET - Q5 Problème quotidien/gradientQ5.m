function y = gradient_Rosenbrock(x)

X = x(1);
Y = x(2);

y(1) =  (5*(2*X - 2))/(2*((X - 1)^2 + (Y - 3)^2)^(1/2)) + (2*(2*X - 4))/((X - 2)^2 + (Y - 1)^2)^(1/2) + (3*(2*X - 4))/(2*((X - 2)^2 + (Y - 2)^2)^(1/2)) + (6*X)/(X^2 + Y^2)^(1/2);
y(2) = (2*(2*Y - 2))/((X - 2)^2 + (Y - 1)^2)^(1/2) + (3*(2*Y - 4))/(2*((X - 2)^2 + (Y - 2)^2)^(1/2)) + (5*(2*Y - 6))/(2*((X - 1)^2 + (Y - 3)^2)^(1/2)) + (6*Y)/(X^2 + Y^2)^(1/2);
y = [y(1); y(2)];
end

