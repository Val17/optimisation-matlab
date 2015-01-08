%  Méthode des fortes pentes avec  préconditionnement

function x = steepest_descent (x, epsilon, beta1, beta2, lambda)

% Pour connaitre le nombre d'itérations, on utilise un compteur
% initialisé a 0

iterations = 0;

% Pour connaître le temps de calcul, on utilise les fonctions tic et toc.

tic

% Pour l'initialisation de alpha dans l'algorithme de FL

alpha_i = 0.001;

% La boucle se terminera si le test de fin est passé (cf T.15 chap 3)

while (norm (gradient_Rosenbrock(x)) > epsilon)
    
    d = - gradient_Rosenbrock(x);
    
    % Calcul de alpha via l'algorithme de Fletcher et Lemaréchal défini
    % dans le fichier FL.m
    
    alpha = FL(x, d, alpha_i, beta1, beta2, lambda);
    
    % On définit une nouvelle valeur de x avec une nouvelle valeur
    % de alpha, déterminée via l'algorithme de FL
    
    x = x + alpha * d;
       
    % On trace le cheminement du point courant au cours des itérations
    % sur une courbe de niveau.

    plot(x(1),x(2),'+', 'MarkerEdgeColor','r');
    
    % On incrémente le compteur d'itérations
     
    iterations = iterations +1;
    
end    

% On affiche le nombre d'itérations:
iterations
% On affiche le resultat trouvé:
disp('Vecteur trouvé');
x
% On évalue la fonction coût en ce point:
disp('Fonction coût en ce point');
Rosenbrock(x)
% On évalue la qualité de la solution:
disp('Qualité de la solution');
max(gradient_Rosenbrock(x))
% On affiche le temps de calcul de cette méthode
disp('Temps de calcul: Plus forte pente');
toc
    
end
         

