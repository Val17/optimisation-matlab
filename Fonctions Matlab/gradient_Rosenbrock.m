function y = gradient_Rosenbrock(x)

y(1) = (2-400*x(2))*x(1) + 400*x(1)^3 -2;
y(2) = 200 *x(2) - 200 * x(1)^2;

y=[y(1); y(2)];

end

