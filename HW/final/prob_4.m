%% his code
A = 101* eye (100) - ones (100 ,100) ;
B = gallery ('fiedler' ,1:10) ;
C = invhilb (5) ;
D = diag (1.5* ones (1 ,10) ) - diag ( ones (1 ,9) ,1) ...
- diag ( ones (1 ,9) , -1) ;

is_posdef(A) % 1
is_posdef(B) % 0 
is_posdef(C) % 1
is_posdef(D) % 0

%% my func hehe
function posdef = is_posdef(A)
    s = size(A,1);
    flag = 0;
    for k = 1:s-1 %cols
        if(A(k,k)<=0)
            posdef = 0;
            flag = 1;
            break
        end
        
        if(k == s-1)
            if(A(k+1,k+1)<0)
                flag = 1;
                posdef = 0;
                break
            end
        end
        if(flag == 1)
            break;
        end
        for i = k+1:s %rows 
            l = A(i,k)/A(k,k);
            for j = k+1:s
               A(i,j) = A(i,j)-l*A(k,j);
            end
        end
    end
    if(flag ~= 1)
        posdef=1;
    end
end

