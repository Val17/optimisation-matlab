%% Mini Projet - Optimisation Continue
% DAVY - MARCHET

%% Question 1
% Nous allons représenter la fonction de Rosenbrock pour -2<x1<2 et
% -4<x2<4. 
%%
[x1,x2] = meshgrid (-2:0.1:2, -4:0.1:4);
R=Rosenbrock(x1,x2);
figure;
surf(x1,x2,R);
title('Fonction de Rosenbrock');
xlabel('x1');
ylabel('x2');
%% Question 2
% Nous allons utiliser la méthode des plus fortes pente avec
% préconditionnement. 
% Pour cela, le pas va être déterminé de manière linéaire à chaque
% itération de façon à respecter les conditions de Wolfe.
% La matrice Dk choisie est la matrice identité.
% Le pas ne doit pas être trop grand, ni trop petit. Pour cela, nous allons
% utilisé l'algortihme de Fletcher et Lemaéchal.
%%
% Pour calculer dk, on utilisera la fonction gradient_Rosenbrock
%%
