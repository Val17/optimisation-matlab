% Méthode de Newton avec recherche linéaire

 function x = newton_lineaire (x, epsilon, beta1, beta2, lambda)
  
alpha_i = 1;

% Pour déterminer le nombre d'itérations, 
% on définit une variable qui sera incrémentée de 1
% à chaque itération dans la boucle while suivante.

iterations = 0;

% Pour connaître le temps de calcul, on utilise les fonctions tic et toc.

tic
     
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

    plot(x(1),x(2),'+', 'MarkerEdgeColor','r');
    
    % On incrémente le compteur d'itérations
    iterations = iterations + 1;
     
end

% On affiche le nombre d'itérations
iterations
% On affiche le resultat trouvé
disp('Vecteur trouvé');
x
% On évalue la fonction coût en ce point:
disp('Fonction coût en ce point');
Rosenbrock(x)
% On évalue la qualité de la solution:
disp('Qualité de la solution');
max(gradient_Rosenbrock(x))
% On affiche le temps de calcul de cette méthode
disp('Temps de calcul: Newton Lineaire');
toc

end
 
 