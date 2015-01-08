%% Mini Projet - Optimisation Continue
% DAVY - MARCHET
%%
% Ce fichier contient le déroulement des quatre premières questions du
% sujet. On y définit les paramètres utiles à nos algorithmes et nous
% appelons les méthodes au fur et à mesure.
% Les conclusions suite aux résultats obtenus seront développées dans le
% rapport.
%%
close all;
clear;



%% Question 1
% Nous allons représenter la fonction de Rosenbrock pour -2<x1<2 et
% -4<x2<4. 
% Pour cela, nous utilisons la fonction mesgrid de Matlab.
%%
[X,Y] = meshgrid (-2:0.1:2, -4:0.1:4);
%%
% Nous définissons la fonction de Rosenbrock (R).
%%
R=100.*(Y - X.^2).^2 + (1 - X).^2;
%%
% Nous traçons la fonction gràce à la fonction surf de Matlab qui prend en
% paramètre la fonction et des tableaux de valeurs (obtenus avec la
% fonction meshgrid) afin d'afficher une représentation de la fonction.
%%
figure;
surf(X,Y,R);
title('Fonction de Rosenbrock');
xlabel('x1');
ylabel('x2');



%% Question 2
% Nous allons utiliser la méthode des plus fortes pente avec
% préconditionnement. 
% Le fichier utilisé est "steepest_descente.m" qui regroupe tous les
% détails de cette méthode. Elle utilise entre autre les algorithmes de
% Fletcher et Lemaréchal (défini dans "FL.m"). 
%%
% On définit notre point de départ.
%%
x=[-1.5;1.5];
%%
% On définit ensuite les différents paramètres utiles dans notre
% algorithme.
%%
epsilon = 0.001;
beta1 = 0.001;
beta2 = 0.99;
lambda = 20;
%%
% On trace ensuite le contour de la fonction de Rosenbrock.
% Dans chaque algortihme, il y a le tracé du point courant qui sera fait
% en plus sur cette figure.
%%
figure;
title('Methode de Newton avec recherche linéaire');
hold on;
contour(X,Y,R);
%%
% On appelle notre fonction qui regroupe l'algorithme dont traite la
% question. 
%%
S = steepest_descent(x,epsilon, beta1, beta2, lambda);
%% Résultats obtenus
% xf = (0.9989,0.9978)'.
% Nombre d'itérations: 1589.
% Temps d'exécution: 3,6 sec.
%% Question 3 
% Nous allons utiliser la méthode de Newton avec recherche linéaire.
% Pour cela, nous utilisons le fichier newton_lineaire.m.
%%
hold off;
epsilon = 0.001;
lambda = 20;
figure;
title('Methode de Newton avec recherche linéaire');
hold on;
contour (X,Y,R);
N = newton_lineaire(x, epsilon, beta1, beta2, lambda);
%% Résultats obtenus
% xf = (1,1)'.
% Nombre d'itérations: 13.
% Temps d'exécution: 0.06 sec.



%% Question 4
% Nous allons utiliser la methode quasi-Newton BFGS
% Pour cela, nous utilisons le fichier BFGS.m.
% Les détails sur cette méthode sont décrits dans ce fichier.
%%
hold off;
epsilon = 0.001;
lambda = 20;
figure;
title('Methode quasi-Newton BFGS');
hold on;
contour (X,Y,R);
B = BFGS(x, epsilon, beta1, beta2, lambda);
%% Résultats obtenus
% xf = (1,1)'.
% Nombre d'itérations: 66.
% Temps d'exécution: 0.13 sec.


%%
% Question 5
% Pour cette partie du projet, nous avons définis l'ensemble des fichiers
% dans le dossier "Problème quotidien". La fonction utilisée n'étant plus
% la même, le calcul du gradient et de la matrice Hessienne sont ainsi
% changées.