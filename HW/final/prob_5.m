A = [5 1 -5; -4 3 -8; 1 -1 5];
p = inf;

% ------------ 1 norm special case
s = size(A);
if( p == 1)
    max_col = norm(A(:,1),1);
    for i = 2:s(2)
        if(max_col < norm(A(:,i),1))
            max_col = norm(A(:,i),1);
        end
    
    end
% ------------ inf norm special case
elseif( p == inf)
    max_row = norm(A(1,:),1);
    for i = 2:s(2)
        if(max_row < norm(A(i,:),1))
            max_row = norm(A(i,:),1);
        end
    
    end
else 

end

51
89
137