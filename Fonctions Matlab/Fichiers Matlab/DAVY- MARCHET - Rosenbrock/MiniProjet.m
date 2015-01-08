%% Mini Projet - Optimisation Continue
% DAVY - MARCHET
%%
% Ce fichier contient le d�roulement des quatre premi�res questions du
% sujet. On y d�finit les param�tres utiles � nos algorithmes et nous
% appelons les m�thodes au fur et � mesure.
% Les conclusions suite aux r�sultats obtenus seront d�velopp�es dans le
% rapport.
%%
close all;
clear;



%% Question 1
% Nous allons repr�senter la fonction de Rosenbrock pour -2<x1<2 et
% -4<x2<4. 
% Pour cela, nous utilisons la fonction mesgrid de Matlab.
%%
[X,Y] = meshgrid (-2:0.1:2, -4:0.1:4);
%%
% Nous d�finissons la fonction de Rosenbrock (R).
%%
R=100.*(Y - X.^2).^2 + (1 - X).^2;
%%
% Nous tra�ons la fonction gr�ce � la fonction surf de Matlab qui prend en
% param�tre la fonction et des tableaux de valeurs (obtenus avec la
% fonction meshgrid) afin d'afficher une repr�sentation de la fonction.
%%
figure;
surf(X,Y,R);
title('Fonction de Rosenbrock');
xlabel('x1');
ylabel('x2');



%% Question 2
% Nous allons utiliser la m�thode des plus fortes pente avec
% pr�conditionnement. 
% Le fichier utilis� est "steepest_descente.m" qui regroupe tous les
% d�tails de cette m�thode. Elle utilise entre autre les algorithmes de
% Fletcher et Lemar�chal (d�fini dans "FL.m"). 
%%
% On d�finit notre point de d�part.
%%
x=[-1.5;1.5];
%%
% On d�finit ensuite les diff�rents param�tres utiles dans notre
% algorithme.
%%
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 20;
%%
% On trace ensuite le contour de la fonction de Rosenbrock.
% Dans chaque algortihme, il y a le trac� du point courant qui sera fait
% en plus sur cette figure.
%%
figure;
title('Methode de Newton avec recherche lin�aire');
hold on;
contour(X,Y,R);
%%
% On appelle notre fonction qui regroupe l'algorithme dont traite la
% question. 
%%
S = steepest_descent(x,epsilon, beta1, beta2, lambda);
%% R�sultats obtenus
% xf = (0.9989,0.9978)'.
% Nombre d'it�rations: 1589.
% Temps d'ex�cution: 3,6 sec.
%% Question 3 
% Nous allons utiliser la m�thode de Newton avec recherche lin�aire.
% Pour cela, nous utilisons le fichier newton_lineaire.m.
%%
hold off;
epsilon = 0.001;
lambda = 20;
figure;
title('Methode de Newton avec recherche lin�aire');
hold on;
contour (X,Y,R);
N = newton_lineaire(x, epsilon, beta1, beta2, lambda);
%% R�sultats obtenus
% xf = (1,1)'.
% Nombre d'it�rations: 13.
% Temps d'ex�cution: 0.06 sec.



%% Question 4
% Nous allons utiliser la methode quasi-Newton BFGS
% Pour cela, nous utilisons le fichier BFGS.m.
% Les d�tails sur cette m�thode sont d�crits dans ce fichier.
%%
hold off;
epsilon = 0.001;
lambda = 20;
figure;
title('Methode quasi-Newton BFGS');
hold on;
contour (X,Y,R);
B = BFGS(x, epsilon, beta1, beta2, lambda);
%% R�sultats obtenus
% xf = (1,1)'.
% Nombre d'it�rations: 66.
% Temps d'ex�cution: 0.13 sec.


%%
% Question 5
% Pour cette partie du projet, nous avons d�finis l'ensemble des fichiers
% dans le dossier "Probl�me quotidien". La fonction utilis�e n'�tant plus
% la m�me, le calcul du gradient et de la matrice Hessienne sont ainsi
% chang�es.