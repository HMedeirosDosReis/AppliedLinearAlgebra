%% Problem 4: Image inpainting with face-space regularization
load eigenfaces %load mean face "xmean" and eigenfaces matrix "U"
dim = [32,32];

load('greg.mat'); %load greg image
x = x(:);

% define A matrix
mask = ones(dim);
mask(3:12,3:30) = 0;
A = diag(mask(:));

% show masked image
fig = figure(1);
imshow(reshape(A*x,dim),[]); drawnow;
title('masked image','fontsize',14);
truesize(fig,[200,200]);
%% Task (b): Implement RLS solution
b = A*x;
y = xmean';
Uhat = U(:,1:20);
I = eye(prod(dim));

% TODO: fill in code below
% x_rls = ...
L = (I-Uhat*Uhat');
lambda = 0.1;
x_rls = ((A'*A)+(lambda*(L*L')))\(A'*b-(A*y))+y;

fig = figure(2); 
imshow(reshape(x_rls,dim),[]); drawnow;
truesize(fig,[200,200]);
%% visualize original, masked image, and restored image together
fig = figure(3);
subplot(1,3,1);
imshow(reshape(x,dim),[0,1]);
title('original');
subplot(1,3,2);
imshow(reshape(A*x,dim),[0,1]);
title('masked image');
subplot(1,3,3);
imshow(reshape(x_rls,dim),[0,1]);
title('restored image');