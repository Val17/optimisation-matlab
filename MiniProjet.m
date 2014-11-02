%% Mini Projet - Optimisation Continue
% DAVY - MARCHET

%% Question 1
% Nous allons repr�senter la fonction de Rosenbrock pour -2<x1<2 et
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
% Nous allons utiliser la m�thode des plus fortes pente avec
% pr�conditionnement. 
% Pour cela, le pas va �tre d�termin� de mani�re lin�aire � chaque
% it�ration de fa�on � respecter les conditions de Wolfe.
% La matrice Dk choisie est la matrice identit�.
% Le pas ne doit pas �tre trop grand, ni trop petit. Pour cela, nous allons
% utilis� l'algortihme de Fletcher et Lema�chal.
%%
% Pour calculer dk, on utilisera la fonction gradient_Rosenbrock
%%
