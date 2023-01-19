x = (-128:128)'/128;
A = [x.^0 x.^1 x.^2 x.^3];
[Q,R] = qr(A,0);

scale = Q(257, :);
Q = Q*diag(1 ./scale);
figure()
plot(Q)