%% Mini Projet - Optimisation Continue
% DAVY - MARCHET
close all;
clear;
%% Question 1
% Nous allons repr�senter la fonction de Rosenbrock pour -2<x1<2 et
% -4<x2<4. 
%%
[X,Y] = meshgrid (-2:0.1:2, -4:0.1:4);
R=100.*(Y - X.^2).^2 + (1 - X).^2;
figure;
surf(X,Y,R);
title('Fonction de Rosenbrock');
xlabel('x1');
ylabel('x2');
%% Question 2
% Nous allons utiliser la m�thode des plus fortes pente avec
% pr�conditionnement. 
% Pour cela, le pas va �tre d�termin� de mani�re lin�aire � chaque
% it�ration de fa�on � respecter les conditions de Wolf.
% La matrice Dk choisie est la matrice identit�.
% Le pas ne doit pas �tre trop grand, ni trop petit. Pour cela, nous allons
% utilis� l'algortihme de Fletcher et Lema�chal.
%%
% Pour calculer dk, on utilisera la fonction gradient_Rosenbrock
%%
hold off;
x=[-1.5;1.5];
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 20;
figure;
title('Methode de descente a forte pente');
hold on;
contour(X,Y,R);
S = steepest_descent(x,epsilon, beta1, beta2, lambda);
%% R�sultats obtenus
% Le vecteur trouv� est le vecteur: xf = (0.9989;0.9978).
% On attendait le vecteur (1;1).
% De plus, le nombre d'it�rations est de 1589.
% Enfin, la dur�e que mettent l'algorithme pour converger vers une solution
% satisfaisant les conditions impos�es est de 3,6 sec.
%% Premi�res conclusions
% Ainsi, cette m�thode n'est pas adapt� � notre probl�me: la solution
% toruv�e n'est pas la solution attendue
%% Question 3 
% Nous allons utiliser la m�thode de Newton avec recherche lin�aire.
% Pour cela, nous utilisons le fichier newton_lineaire.m.
%%
hold off;
x=[-1.5;1.5];
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 25;
figure;
title('Methode de Newton lineaire');
hold on;
contour (X,Y,R);
N = newton_lineaire(x, epsilon, beta1, beta2, lambda);
%% Question 4
% Nous allons utiliser la methode quasi-Newton BFGS
% Pour cela, nous utilisons le fichier BFGS.m
%%
hold off;
x=[-1.5;1.5];
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 20;
figure;
title('Methode quasi-Newton BFGS');
hold on;
contour (X,Y,R);
B = BFGS(x, epsilon, beta1, beta2, lambda);