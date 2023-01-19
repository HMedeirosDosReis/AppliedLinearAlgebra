function dist = facedist(x,mu,U)
    %inputs:
    %x = input image as 32x32 matrix
    %mu = mean image as 1024x1 col vector
    %U = 1024x400 matrix of top eigenfaces
    vectorImage = x(:);
    demeanedImage = vectorImage-mu; %u 
    UUTInv = (U(:,1:150).'*U(:,1:150))\eye(150);
    projectImg = (U(:,1:150)*UUTInv*((U(:,1:150).')*demeanedImage));
    %output:
    %dist = distance of de-meaned input image from face space

    dist=norm(projectImg-demeanedImage);
end

