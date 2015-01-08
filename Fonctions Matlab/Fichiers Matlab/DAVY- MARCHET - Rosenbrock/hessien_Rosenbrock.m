% Hessien de la fonction de Rosenbrock 

function y = hessien_Rosenbrock(x)

y1 = -400.*x(2) + 1200.*x(1).^2 + 2;
y2 = -400.*x(1);
y3 = -400.*x(1);
y4 = 200;

y=[y1, y2; y3, y4];

end
