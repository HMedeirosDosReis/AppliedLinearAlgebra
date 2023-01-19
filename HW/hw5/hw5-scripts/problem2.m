%% Problem 2: Image denoising using regularized least squares
%load image
I = imread('merganser.png');
I = rgb2gray(I);
I = im2double(I);
I = I(200:800,1:1200);
dim = size(I);
b = I(:);

% visualize noisy image
fig = figure(1);
imshow(reshape(b,dim),[0,1]);
title('noisy image');
set(gca,'fontsize',16);
set(fig,'position',[10 100 1000 500]);
%% Task (a): Implement regularized least squares
%vertical and horizontal finite differences
h1 = [1 -1];
L1 = convmtx2(h1,dim); %horiztonal differences matrix
h2 = [1;-1];
L2 = convmtx2(h2,dim); %vertical differences matrix
L = [L1; L2]; %stack matrices
I = speye(prod(dim));

%TODO: fill in code below for RLS solution
%x_rls = ...
lambda = 1;
x_rls = (I+(lambda*(L'*L)))\b;
%visualize result
fig = figure(2);
subplot(2,1,1);
imshow(reshape(b,dim),[0,1]);
title('original (noisy)');
set(gca,'fontsize',14);
subplot(2,1,2);
imshow(reshape(x_rls,dim),[0,1]);
title('RLS solution -- FD regularization');
set(gca,'fontsize',14);

%% Task (b): try out different regularization parameters
lambda = 0.01;
lambda = 15;
lambda = 1.2;

%% 
lambda = 1.2;
x_rls = (I+(lambda*(L'*L)))\b;
%visualize result
fig = figure(2);
subplot(2,1,1);
imshow(reshape(b,dim),[0,1]);
title('original (noisy)');
set(gca,'fontsize',14);
subplot(2,1,2);
imshow(reshape(x_rls,dim),[0,1]);
title('RLS solution -- FD regularization');
set(gca,'fontsize',14);
