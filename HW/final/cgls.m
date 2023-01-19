%% Conjugate Gradients Least Squares  ---- a 
function [x,flag,relres,iter] = cgls(x0,b,A,At,tol,maxit)
    x = x0; %
    r = b-A(x); %
    s = At(r); %
    p = s; %
    delta = s'*s;% 
    for k=1:maxit
        q = A(p);
        alpha = delta/(q'*q);
        x = x + alpha*p;
        r = r - alpha*q;
        s = At(r);
        delta_prev = delta;
        delta = s'*s;
        p = s+(delta/delta_prev)*p;
        iter = k;
    
        if delta < tol*norm(At(b),2)
            flag = 0;
            relres = norm(A(x)-b,2)/norm(b,2);
            break;
        end
        if k == maxit
            flag = 1;
        end
    end

end


