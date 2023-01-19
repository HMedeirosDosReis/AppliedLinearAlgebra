%% load data
load images %loads matrix X, each row is vectorized image
dim = [32,32]; %image size
%% visualize one of the images in the dataset
k = 2;
figure(1);
img = reshape(X(k,:),dim);
imagesc(img); axis image; axis off; colormap gray
%% compute sample mean and covariance
mu = mean(X,1)'; %sample mean
Sigma = cov(X); %sample covariance matrix
%% todo: compute random samples from distribution N(mu,Sigma)
  
 figure(2)
 samp_img =  (chol(Sigma)'*randn(1024,1) + mu);
 samp_img = reshape(samp_img,dim);
 imagesc(samp_img); axis image; axis off; colormap gray

%% part a
mu = [1 ;-1; 0.5];
sigma = [1 0.5 0.5;0.5 2 0.3;0.5 0.3 1.5];
n = 10000;
X = zeros([n,3]);
for i=1:n
    X(i,:) =  (chol(sigma)'*randn(3,1) + mu);
end

C = cov(X);
C

