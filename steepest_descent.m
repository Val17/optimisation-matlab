function  y = steepest_descent (f,x1,x2, b1, b2, epsilon)

resultat = false;

while(resultat == false)
    d = - gradient_Rosenbrock(f) .* eye(2);
    
    a = 0;
    alpha = arg (min (f(x1 + a*d, x2 + a*d)));
    alpha_r = 50000;
    resultat_FL = 0;
    
    while(resultat_FL == 0)
        if (f(x1 + alpha * d, x2 + alpha*d) <= f(x1,x2) + alpha * b1 * gradient_Rosenbrock(x1,x2)'*d && (gradient_Rosenbrock(x1+alpha*d,x2+alpha*d)'*d)/(gradient_Rosenbrock(x1,x2)'*d) <= b2) 
                resultat_FL = 1;
    %% alpha viole CW1
        elseif (f(x1 + alpha * d, x2 + alpha*d) > f(x1,x2) + alpha * b1 * gradient_Rosenbrock(x1,x2)'*d)
            
                alpha_r = alpha;
                alpha = (alpha_r + alpha_l)/2;
        else
            alpha_l = alpha;
            if (alpha_r < 50000)
                alpha = (alpha_l + alpha_r)/2;
            
           
            else
                alpha = lambda * alpha;
              
            end;
        end;
    end;
    
    x2 = alpha*d + x1;
    
    if (abs(gradient_Rosenbrock(x1,x2)) <= epsilon)
        resultat=true;
        y = (x1,x2);
    end;
end;
    
         

