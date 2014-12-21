% Méthode de Newton avec recherche linéaire

 function x = newton_lineaire (x, epsilon, beta1, beta2, lambda)
  
alpha_i = 1;

% Pour déterminer le nombre d'itérations, 
% on définit une variable qui sera incrémentée de 1
% à chaque itération dans la boucle while suivante.

iterations = 0;
     
while ( norm( gradient_Rosenbrock(x) ) > epsilon )
    
    % tau est déterminé via la factorisation de Cholesky
    % On factorise la matrice hessienne de f de manière à avoir un nombre 
    % de conditionnement égal à 1.

    L = factorisation_Cholesky(x); % taille 2,2

    % On souhaite trouver z tel que: L * z = gradient_Rosenbrock(x)

    z = L^(-1) * gradient_Rosenbrock(x); %taile 2,1
    

    % On souhaite trouver d tel que Lt * d = -z

    d = (L.')^(-1) * (-z); %taille 2,1
    

    % Utilisation de l'algorithme de Fletcher et Lemaréchal avec comme 
    % valeur d'initialisation alpha_i = 1.

    alpha = FL(x, d, alpha_i, beta1, beta2, lambda);
    x = x + alpha * d;

    % On trace le cheminement du point courant au cours des itérations
    % sur une courbe de niveau.

    plot(x(1),x(2),'+');
    
    % On incrémente le compteur d'itérations
    iterations = iterations + 1;
     
end

% On affiche le nombre d'itérations

 iterations
 
 % On affiche le résultat obtenu
 
 x
 
 