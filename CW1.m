function y = CW1(x, d, alpha, beta1)

% Définition de gamma (en fonction de la pente en xk dans la direction dk
% cf Chapitre 3 T.17 - 1ère condition de Wolf)

gamma = - beta1 * gradient_Rosenbrock(x)' * d;

if ((Rosenbrock(x + alpha*d)) <= (Rosenbrock(x) - alpha * gamma))
    % CW1 verifiee
    y = true;
    
else
    % CW1 non verifiee
    y = false;
    
end

