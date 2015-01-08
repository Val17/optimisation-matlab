% Algorithme de Fletcher et Lemaréchal (noté FL)

function alpha = FL(x, d, alpha_i, beta1, beta2, lambda)

% d est la direction

% lambda est le parametre qui sert definir alpha si la CW1 n'est pas
% respectée

alpha_r = 50000; %alpha_r tend vers l'infini
alpha_l = 0;

% L'initialisation se fait par le premier appel de cette fonction:
% le paramètre alpha vaudra alpha_i la première fois.

alpha = alpha_i;

% 1ère et 2ème condition de Wolf (CW1 et CW2) respectées

if (CW1(x, d, alpha, beta1) == true & CW2(x, d, alpha, beta2) == true)
    
        alpha = alpha;
        
% CW1 et CW2 non respectées alors, test sur la CW1 seulement
 
else
       % CW1 violee
        
        if (CW1(x, d, alpha, beta1) == false)
        
            alpha_r = alpha;
            alpha = (alpha_r + alpha_l) / 2;
            
         % CW1 verifiee
         
        else
            
            alpha_l = alpha;
            
            % test en fonction de alpha_r
            
            if (alpha_r < 50000)
                
                alpha = (alpha_l + alpha_r) / 2;
                
            else
                alpha = lambda * alpha_l;
                
            end
        end
end

end
    
    
     
     