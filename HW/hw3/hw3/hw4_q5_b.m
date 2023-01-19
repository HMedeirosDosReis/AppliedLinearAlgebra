
x = (-128:128)'/128;
A = [x.^0 x.^1 x.^2 x.^3];
[Q,R] = qr(A,0);

scale = Q(257, :);
Q = Q*diag(1 ./scale);

P = Q*(Q'*Q)^(-1)*Q';
y = cos(pi*x);
py = P*y; 
figure()
plot(y)
hold on
plot(py)
hold off


%6 polynomials

x = (-128:128)'/128;
A = [x.^0 x.^1 x.^2 x.^3 x.^4 x.^5];
[Q,R] = qr(A,0);

scale = Q(257, :);
Q = Q*diag(1 ./scale);

P = Q*(Q'*Q)^(-1)*Q';
y = cos(pi*x);
py = P*y; 
figure()
plot(y)
hold on
plot(py)
hold off

%8 polynomials

x = (-128:128)'/128;
A = [x.^0 x.^1 x.^2 x.^3 x.^4 x.^5 x.^6 x.^7];
[Q,R] = qr(A,0);

scale = Q(257, :);
Q = Q*diag(1 ./scale);

P = Q*(Q'*Q)^(-1)*Q';
y = cos(pi*x);
py = P*y; 
figure()
plot(y)
hold on
plot(py)
hold off

