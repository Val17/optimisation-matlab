% Factoriasation de Cholesky

function A = factorisation_Cholesky(x)

% On cherche a faire en sorte que la matrice A (A = H + tau * I2 
% o� H est la matrice hessienne) s'ecrive sous la forme:
% A=LLt (o� Lt est la transpos�e de la matrice L)
% (L �tant une matrice triangulaire sup�rieure).

% On definit un booleen qui determine si la factorisation
% de Chloesky la matrice A est reussie ou non

factorisation = false;

% Initialisation de tau
H = hessienQ5(x);
minimum_diag = min(H(1,1),H(2,2));
        
if minimum_diag >  0
    
    tau = 0;
    
else
    
    % Utilisation de la norme de Frob�nius
    
    tau = norm(H);
    
end;

% La factorisation a r�ussi si les valeurs propres (eig)
% de la matrice A sont toutes positives.
% Cela peut se traduire aussi par un test de positivit�
% de la plus petite des valeurs propres

 while (factorisation == false)
     
     if (min(eig(H + tau * eye(2)))<=0)
        tau = max(2 * tau, 1/2 * norm(H));
        factorisation = false;
     else
         factorisation = true;
     end
 end
 
 % On a trouv� tau tel que hessient_Rosenbrock (x) + tau * eye(2) 
 % aient des valeurs propres positives.
 
 A = chol(H + tau * eye(2));
     