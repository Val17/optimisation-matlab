%% Mini Projet - Optimisation Continue
% DAVY - MARCHET
close all;
clear;
%%
% Question 5
% Nous allons à présent définir un problèeme de notre quotidien et utiliser
% les méthodes que nous avons utilisés précedemment.
%%
[X,Y] = meshgrid (-2:0.5:4, -1:0.5:4);
W = 6.*sqrt((X.^2 + Y.^2)) + 4.*sqrt((X-2).^2 + (Y-1).^2) + 3.*sqrt((X-2).^2 + (Y-2).^2) + 5.*sqrt((X-1).^2 + (Y-3).^2);
figure;
surf(X,Y,W);
title('Problème quotidien');
xlabel('x1');
ylabel('x2');
%%
hold off;
x=[-1;1];
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 20;
figure;
title('Methode des plus fortes pentes');
hold on;
contour(X,Y,W);
S = steepest_descent(x,epsilon, beta1, beta2, lambda);
%%
hold off;
x=[-1;1];
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 25;
figure;
title('Methode de Newton avec recherche linéaire');
hold on;
contour (X,Y,W);
N = newton_lineaire(x, epsilon, beta1, beta2, lambda);
%%
hold off;
x=[-1;1];
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 20;
figure;
title('Methode quasi-Newton BFGS');
hold on;
contour (X,Y,W);
B = BFGS(x, epsilon, beta1, beta2, lambda);
