function y = CW2 (x, d, alpha, beta2)

if(((gradientQ5(x + alpha * d)' *d) / (gradientQ5(x)' * d ))<= beta2 )
    % CW2 verifiee
    y = true;
    
else
    % CW2 non verifiee
    y = false;
    
end
