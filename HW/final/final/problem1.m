%% load blurry image
load blurryimg %loads vectorized blurry image, b
dim = [472, 510]; %image dimensions

figure; % show blurry image
imagesc(reshape(b,dim),[0,1]); axis image; axis off; colormap gray
title('blurry image, b')

%% define A and At as function handles
vec = @(x) x(:); %helper functions for reshaping
unvec = @(x) reshape(x,dim);
h = ones(9,9)/81; %9x9 uniform blur kernel
A = @(x) vec(conv2(unvec(x),h,'same'));
At = A; %A is self-adjoint

%% Todo: run CGLS algorithm to deblur the image
% visualize the output x with the command below
% imagesc(reshape(x,dim),[0,1]); axis image; axis off; colormap gray

