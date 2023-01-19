A = [1 1 1; 1.0001 1 1; 1.0001 1.0001 1]; 
format long 
[Qc, Rc] = classicQR(A);
[Qm, Rm] = modifiedQR(A);
[Q,R] = qr(A);

disp("The Q matrix for the three aproaches: ")
disp("Using Matlab's QR: ")
disp(Q)
disp("Using the Classic Gram Schimt: ")
disp(Qc)
disp("Using the Modified Gram Schimt: ")
disp(Qm)

disp("The R matrix for the three aproaches: ")
disp("Using Matlab's QR: ")
disp(R)
disp("Using the Classic Gram Schimt: ")
disp(Rc)
disp("Using the Modified Gram Schimt: ")
disp(Rm)

disp("Now, check if they are unitary: ")
disp("Using Matlab's QR: ")
disp(Q'*Q)
disp("Using the Classic Gram Schimt: ")
disp(Qc'*Qc)
disp("Using the Modified Gram Schimt: ")
disp(Qm'*Qm)

function [Q, R] = classicQR(A)
    for j=1:size(A)
        vj = A(:,j);
        for i=1:j-1
            R(i,j) = Q(:,i)'*A(:,j);
            vj=vj-R(i,j)*Q(:,i);
        end
        R(j,j)=norm(vj);
        Q(:,j)=vj/R(j,j);
    end
end

function [Q, R] = modifiedQR(A)
    for i=1:size(A)
        V(:,i) = A(:,i);
    end
    for i=1:size(A)
        R(i,i) = norm(V(:,i));
        Q(:,i) = V(:,i)/R(i,i);
        for j=i+1:size(A)
            R(i,j) = Q(:,i)'*V(:,j);
            V(:,j) = V(:,j)-R(i,j)*Q(:,i);
        end
    end
end