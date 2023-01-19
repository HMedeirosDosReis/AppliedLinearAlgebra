%%
A = [4 1 1; 1 2 0 ;1 0 1]

[L,D] = ldl(A)
R = chol(A)
%%
B = [4 1 1; 1 2 -1 ;1 -1 1]

[L,D] = ldl(A)
R = chol(A)