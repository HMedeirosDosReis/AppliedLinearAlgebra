%% b 
Amat = [5 1 1; 1 5 1; 1 1 5; 1 1 1];
b = [1; 2; 3; 4];
A = @( x ) Amat*x ;
At = @( x ) Amat'* x ;
x0 = [0; 0; 0];
[x , flag , relres , iter ] = cgls (x0 ,b ,A , At ,1e-10 ,10);

%%
fprintf("flag: %d, relres: %.4f, iter: %d \n\n", flag,relres,iter)

disp(x)
disp(Amat\b)
