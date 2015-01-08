% Fonction de Rosenbrock

function y = Rosenbrock(x)
y = 100.*(x(2) - x(1).^2).^2 + (1 - x(1)).^2;

end