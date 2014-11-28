% Hessien de la fonction de Rosenborck 
function y = hessien_Rosenbrock(x)

y1 = -400.*x(2) + 1200.*x(1).^2;
y2 = 200 .*x(2) - x(1).^2 *200;
y3 = -400.*x(1);
y4 = -400 .*x(1);

y=[y1, y2; y3, y4];
