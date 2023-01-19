%% c 
% define A as a function handle
dim = [200 ,200];
vec = @( x ) x (:) ; % helper functions for reshaping
unvec = @( x ) reshape (x , dim ) ;
h = [0 -1 0; -1 4 -1; 0 -1 0]; % discrete Laplacian
A = @( x ) vec ( conv2 ( unvec ( x ) ,h , 'same') ) ;
% test out A function
x = randn (40000 ,1) ;
y = A ( x ) ; % equivalent to A*x

my_con = condition(40000, A);
disp(my_con)

%% initialize needed variables
size = 10;
A = @( x ) (1:10)'.* x ;
my_con = condition(size, A);
disp(my_con)


%%
function cond_num = condition(size,A)
    % find largest eigen value 
    v = randn(size,1); %random initialization
    v = v/norm(v);
    for k = 1:1000
        u = A(v);
        v = u/norm(u);
        lam_larg = v'*(A(v));
        relres = norm(A(v)-lam_larg*v)/norm(v); %should be close to zero;
        if(relres < 1e-10)
            break
        end
    end
    % find smallest eigen value
    v = randn(size,1); %random initialization
    v = v/norm(v);
    for k = 1:1000
        % need to solve Au = v
        u = v; 
        r = v-A(u);
        p = r;
        delta = r'*r;
        for k=1:5000
            S = A(p);
            alpha = delta/(p'*S);
            u = u + alpha*p;
            r = r - alpha*S;
            prev_delt = delta;
            delta = r'*r;
            p = r+delta/prev_delt*p;
            
            if delta < 0.01
                %fprintf('reached exit tol at iter %d\n',k);
                break;
            end
        end
        v = u/norm(u);
        lam_small = v'*(A(v));
        % verify we found an eigenvalue:
        relres = norm(A(v)-lam_small*v)/norm(v); %should be close to zero
        if(relres < 1e-10)
            break
        end
    end
    cond_num = lam_larg/lam_small;
    disp(lam_small)
    disp(lam_larg)
end



