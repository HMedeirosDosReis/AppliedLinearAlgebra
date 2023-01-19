%% HW3, Problem 4: face detection task
%% Run this cell first to load mu and U
load faces
mu = mean(X, 2); %mean face image (vectorized)
[U,S,V] = svd(X-mu,'econ'); %colums of U are the (vectorized) eigenfaces

%% Part (a) define the "facedist" function 
% You can "prototype" your function here first using mu and U loaded above
% Then save your function in the file "facedist.m"

%% Part (b) test out the "facedist" function here
%example: test facedist function on the "greg" image
load greg %loads image into variable x
figure(1); 
imagesc(x); %show the image
axis image; axis off; colormap gray

dist1 = facedist(x,mu,U);
disp(dist1)
%do other tests here

load nic_cage %loads image into variable x
figure(2); 
imagesc(x); %show the image
axis image; axis off; colormap gray

dist1 = facedist(x,mu,U);
disp(dist1)

x=rand(32,32); %loads image into variable x
figure(3); 
imagesc(x); %show the image
axis image; axis off; colormap gray

dist1 = facedist(x,mu,U);
disp(dist1)

%% Part (c), step 1: Compute distance of each image patch from "face space"
% After making updates to facedist.m, run this code block 
% *WARNING* this code block can take several minutes to run dependending
% on how you implement the facedist function. However, an efficient implementation
% should only take a few seconds.

%do not alter the next four lines of code
load friends
fun = @(x) facedist(x,mu,U); %function wrapper
DistImg = nlfilter(img,[32,32],fun); %compute the face space distance of each image patch
NormImg = nlfilter(img,[32,32],@(x) norm(x(:))); %compute the norm of each image patch
%% Part (c), step 2: threshold the distance image, plot the result
thresh = 2.1; %threshold to apply to distance image

%do not alter the code below this line
faceloc = DistImg < thresh;  
faceloc = faceloc & (NormImg  > 15); %filter out dark regions; do not change this

figure(1);
subplot(1,3,1);
imagesc(img);
axis image; axis off; colormap gray
subplot(1,3,2);
imagesc(DistImg);
axis image; axis off; colormap gray
title('distance image');
subplot(1,3,3);
nimg = zeros([size(img), 3]);
nimg(:,:,1) = 0.7*img;
nimg(:,:,2) = 0.7*img + faceloc;
nimg(:,:,3) = 0.7*img;
imagesc(nimg);
axis image; axis off;
title('detected faces (in green)');
