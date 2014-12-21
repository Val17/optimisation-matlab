% M�thode de Newton avec recherche lin�aire

 function x = newton_lineaire (x, epsilon, beta1, beta2, lambda)
  
alpha_i = 1;

% Pour d�terminer le nombre d'it�rations, 
% on d�finit une variable qui sera incr�ment�e de 1
% � chaque it�ration dans la boucle while suivante.

iterations = 0;
     
while ( norm( gradient_Rosenbrock(x) ) > epsilon )
    
    % tau est d�termin� via la factorisation de Cholesky
    % On factorise la matrice hessienne de f de mani�re � avoir un nombre 
    % de conditionnement �gal � 1.

    L = factorisation_Cholesky(x); % taille 2,2

    % On souhaite trouver z tel que: L * z = gradient_Rosenbrock(x)

    z = L^(-1) * gradient_Rosenbrock(x); %taile 2,1
    

    % On souhaite trouver d tel que Lt * d = -z

    d = (L.')^(-1) * (-z); %taille 2,1
    

    % Utilisation de l'algorithme de Fletcher et Lemar�chal avec comme 
    % valeur d'initialisation alpha_i = 1.

    alpha = FL(x, d, alpha_i, beta1, beta2, lambda);
    x = x + alpha * d;

    % On trace le cheminement du point courant au cours des it�rations
    % sur une courbe de niveau.

    plot(x(1),x(2),'+');
    
    % On incr�mente le compteur d'it�rations
    iterations = iterations + 1;
     
end

% On affiche le nombre d'it�rations

 iterations
 
 % On affiche le r�sultat obtenu
 
 x
 
 