

%% ISVHT ------------ a 

Omega = logical ([1 0 1 0; 0 1 0 1; 0 1 1 0; 1 0 1 1]) ;
obs_val = [1; -2; -2; 4; 3; 6; -6; -4; -8];
X = zeros (4 ,4) ; % initialize X with all zeros
X ( Omega ) = obs_val ; %put back in observed entries

%%
r = 1; % chose a target rank r 
for i = 1:1000
    [U,S,V] = svd(X);
    X = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
    X(Omega) = obs_val;
end
disp(X)

%% ISVHT ------------- b
load matcomplete
X = zeros(411,601);
X ( Omega ) = obs_val ;

r = 1; % chose a target rank r ---- between [5,50] 
% initialize X, defined above?

for i = 1:100 %change no num interations
    [U,S,V] = svd(X);
    X = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
    X(Omega) = obs_val;
end
% visualize
disp("done")
imagesc(X,[0,1]);axis image;axis off; colormap gray


%% chosing r

for i = 1:410
    diff=abs(S(i,i)-S(1+i,1+i))/S(1,1);
    disp(diff)
    if diff > 1
        disp(i)
        break
    end
end

