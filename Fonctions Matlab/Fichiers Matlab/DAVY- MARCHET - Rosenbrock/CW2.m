% 2ème condition de Wolfe

function y = CW2 (x, d, alpha, beta2)

if(((gradient_Rosenbrock(x + alpha * d)' *d) / (gradient_Rosenbrock(x)' * d ))<= beta2 )
    % CW2 verifiee
    y = true;
    
else
    % CW2 non verifiee
    y = false;
    
end
