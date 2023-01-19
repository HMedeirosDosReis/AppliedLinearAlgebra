%% Problem 3: image deblurring using regularized least squares
%load image
I = imread('robin.png');
I = rgb2gray(I);
I = im2double(I);
I = imresize(I,0.5);
I = padarray(I,[2,2]);
dim = size(I);
b = I(:);

%visualize blurry image
fig = figure(1);
imshow(reshape(b,dim),[0,1]);
title('blurry image');
%% Task (a): Implement RLS solution
h = fspecial('gaussian',5,1); 
A = convmtx2(h,dim-[4,4]); %% A matrix
I = speye(prod(dim-[4,4])); %% identity

% TODO: fill in code below
% x_rls = ...
lambda = 1;
x_rls = ((A'*A)+(lambda*I))\(A'*b);
%visualize result
fig = figure(2);
subplot(1,2,1);
imshow(reshape(b,dim),[0,1]);
title('original');
subplot(1,2,2);
imshow(reshape(x_rls,dim-[4,4]),[0,1]);
title('deblurred image');

%% Task (b): try out different regularization parameters
lambda = 0.2;
x_rls = ((A'*A)+(lambda*I))\(A'*b);
%visualize result
fig = figure(2);
subplot(1,2,1);
imshow(reshape(b,dim),[0,1]);
title('original');
subplot(1,2,2);
imshow(reshape(x_rls,dim-[4,4]),[0,1]);
title('deblurred image');
