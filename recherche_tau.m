% Recherche de tau

function tau = recherche_tau (H)

% Factorisation reussie si la matrice est definie positive 
% cad que les valeurs propres (egi) sont toutes positives.


% Initialisation de tau

if (min H(i,i) > 0)
    
    tau = 0;
    
else
    
    % Utilisation de la norme de Frobénius
    
    tau = norm(H, 'fro');
    
end;
    
 while (egi(H)<0)
     
     tau = max(2 * tau, 1/2 * norm(H,'fro'));
     
 end;
     
     