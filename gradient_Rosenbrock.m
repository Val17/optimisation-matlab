function y = gradient_Rosenbrock(x1,x2)

y1 = (2-400.*x2).*x1 + 400.*x1.^3 -2;
y2 = 200 .*x2 - x1.^2 *200;

y=[y1, y2]';

