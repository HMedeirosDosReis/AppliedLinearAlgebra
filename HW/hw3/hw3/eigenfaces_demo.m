%% load faces matrix X 
load faces
%columns of of X are vectorized 32x32 pixel images of faces
%this is a subset of the "ORL face dataset" obtained from:
%http://www.cad.zju.edu.cn/home/dengcai/Data/FaceData.html

n = size(X,2); %number of face images
dim = [32,32]; %image dimensins
%% plot an example face
i = 1; 
faceimg = reshape(X(:,i),dim); 
%reshapes the vectorized image back into a 32x32 array

figure(1);
imagesc(faceimg); axis image; axis off; colormap gray
%% compute the mean face image and plot it
mu = mean(X, 2); %compute mean of columns to get mean face image

figure(1);
imagesc(reshape(mu,dim)); axis image; axis off; colormap gray
%% subtract the mean face image from each face
Y = X-mu; %note X is matrix, mu is column vector
Y = Y/sqrt(n-1); %normalize
%% compute SVD of de-meaned data
[U,S,V] = svd(Y,'econ'); %reduced SVD
sigma = diag(S); %get vector of singular values
%% plot singular values
figure;
plot(sigma,'linewidth',2); 
axis tight
title('singular values of Y');
set(gca,'fontsize',18);
%% show 1 through 16th top left singular vectors ("eigenfaces")
figure;
for i = 1:16
    subplot(4, 4, i)
    imagesc(reshape(U(:,i), [32,32]))
    axis image; axis off; colormap gray; 
    title(num2str(i));
end
%% effect of adding in eigenface to the meanface
figure;
a = linspace(-2,2,7);
j = 1; %eigenface index
for i = 1:7
    newface = reshape(a(i)*sigma(j)*U(:,j) + mu, dim);
    subplot(1, 7, i)
    imagesc(newface);
    axis image; axis off; colormap gray; 
    if i == 4
        title('mean face')
    end
end
set(gcf,'Position',[100 100 1000 200])
%% generate random faces
figure;
k = 16; %eigenface cutoff
for i = 1:16
    c = (2*rand(16,1)-1).*sigma(1:k); %weight random vector by eigenvalues.
    randface = reshape(U(:,1:k)*c + mu,dim);
    subplot(4, 4, i)
    imagesc(randface);
    axis image; axis off; colormap gray; 
end
%% generate random face with fixed attribute
figure;
j = 7; %attribute to fix (j=7 is glasses)
k = 16; %max number of eigenfaces
for i = 1:16
    c = 0.75*(2*rand(k,1)-1).*sigma(1:k);
    c(j) = 2*sigma(j);
    randface = reshape(U(:,1:k)*c + mu,[32,32]);
    subplot(4, 4, i)
    imagesc(randface);
    axis image; axis off; colormap gray; 
end
%% reconstruct a face
load greg
x = x(:); %flatten and convert to column vector

k = 25; %number of eigenfaces to use in approximation
recon = U(:,1:k)*U(:,1:k)'*(x-mu);
figure(2);
subplot(1,2,1);
imagesc(reshape(x,dim));
axis image; axis off; colormap gray; 
title("original");
subplot(1,2,2);
imagesc(reshape(recon+mu,dim));
axis image; axis off; colormap gray; 
title("approximation with k="+num2str(k)+" eigenfaces");