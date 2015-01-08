% Algorithme avec  pr�conditionnement

function x = steepest_descent (x, epsilon, beta1, beta2, lambda)

% Pour connaitre le nombre d'it�rations, on utilise un compteur
% initialis� a 0

iterations = 0;

% Pour conna�tre le temps de calcul, on utilise les fonctions tic et toc.

tic

% Pour l'initialisation de alpha dans l'algorithme de FL

alpha_i = 0.001;

% La boucle se terminera si le test de fin est pass� (cf T.15 chap 3)

while (norm (gradientQ5(x)) > epsilon && iterations <2000)
    
    d = - gradientQ5(x);
    
    % Calcul de alpha via l'algorithme de Fletcher et Lemar�chal d�fini
    % dans le fichier FL.m
    
    alpha = FL(x, d, alpha_i, beta1, beta2, lambda);
    
    % On d�finit une nouvelle valeur de x avec une nouvelle valeur
    % de alpha, d�termin�e via l'algorithme de FL
    
    x = x + alpha * d;
       
    % On trace le cheminement du point courant au cours des it�rations
    % sur une courbe de niveau.

    plot(x(1),x(2),'+', 'MarkerEdgeColor','r');
    
    % On incr�mente le compteur d'it�rations
     
    iterations = iterations +1;
    
end    

% On affiche le nombre d'it�rations:
iterations
% On affiche le resultat trouv�:
disp('Vecteur trouv�');
x
% On �value la fonction co�t en ce point:
disp('Fonction co�t en ce point');
fonctionQ5(x)
% On �value la qualit� de la solution:
disp('Qualit� de la solution');
max(gradientQ5(x))
% On affiche le temps de calcul de cette m�thode
disp('Temps de calcul: Plus forte pente');
toc
    
end
         

