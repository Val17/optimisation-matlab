% Méthode de Quasi-Newton version BFGS

function x = BFGS(x, epsilon, beta1, beta2, lambda)

% On utilise un compteur d'itérations, initialisé à 0

iterations = 0;

% Pour connaître le temps de calcul, on utilise les fonctions tic et toc.

tic

d_tilda = 0;

% On initialise les calculs "ci" utilisés dans notre algorithme

for i=1:13
    ci=0;
end

% Initialisation de x (x_i qui est une approximation de la solution
% et H_i (^-1) qui est la matrice inverse Hessienne de la fonction de
% Rosenbrock. 

% Initialisation de H

H = eye(2);

while (norm(gradientQ5(x)) > epsilon && iterations < 2000 )
    
    % Calcul de d

    d = - H * gradientQ5(x);

    % On détermine alpha via l'algorithme de Fletcher et
    % Lemaréchal via la fonction FL. On prendra comme
    % valeur d'initialisation alpha_i = 1

    alpha_i = 1;
    alpha = FL(x, d, alpha_i,  beta1, beta2, lambda);

    % On determiner x tel que: x = x + alpha * d

    x = x + alpha * d;

    % On met a jour H^-1: on détermine pour cela y et d_tilda
    % définis avec la valeur de x a l'itération précédente.

    y = gradientQ5(x) - gradientQ5(x - alpha * d); % taille (2,1)
    d_tilda = alpha * d; % taille (2,1)
    
    % On découpe le calcul de H en plusieurs calculs "ci"
    
    c1 = (d_tilda * y'); % taille (2,2)
    c2 = (d_tilda' *y); % taille (1,1)
    c3 = c1 / c2; % taille (2,2)
    c4 = eye(2) - c3; % taille (2,2)
    c5 = c4 * H; % taille (2,2)
    c6 = (y * d_tilda'); % taille (2,2)
    c7 = (d_tilda' * y); % taille (1,1)
    c8 = c6 / c7; % taille (2,2)
    c9 = eye(2) - c8; % taille (2,2)
    c10 = c5 * c9; % taille (2,2)
    c11 = (d_tilda * d_tilda') ; % taille (2,2)
    c12 = (d_tilda' * y); % taille (1,1)
    c13 = c11 / c12; % taille (2,2)
    H = c10 + c13; % taille (2,2)

    % On trace le cheminement du point courant au cours de sitérations
    % sur une courbe de niveau.

    plot(x(1),x(2),'+', 'MarkerEdgeColor','r');
    
    % On incremente le compteur d'iterations
    iterations = iterations + 1;

end

% On affiche le nombre d'itérations
iterations
% On affiche le resultat trouvé
disp('Vecteur trouvé');
x
% On évalue la fonction coût en ce point:
disp('Fonction coût en ce point');
fonctionQ5(x)
% On évalue la qualité de la solution:
disp('Qualité de la solution');
max(gradientQ5(x))
% On affiche le temps de calcul de cette méthode
disp('Temps de calcul: BFGS');
toc
    
end