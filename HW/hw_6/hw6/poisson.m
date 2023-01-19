%% load and display "source" data
load source_data %load b and dim

vec = @(x) x(:); %helper functions for reshaping
unvec = @(x) reshape(x,dim);

figure(1); %show source distribution
imshow(imresize(unvec(b),2,'nearest'),[]);
title('source data, b','fontsize',16);
%% define A as function handle
h = [0 -1 0; -1 4 -1; 0 -1 0]; %discrete Laplacian
A = @(x) vec(conv2(unvec(x),h,'same'));
%% SD algorithm
x = b; 
r = b-A(x);
delta = r'*r; 
for k=1:5000
    S = A(r);
    alpha = delta/(r'*S);
    x = x + alpha*r;
    r = r - alpha*S;
    delta = r'*r;
    
    %visualize current iterate x (comment out to speed up computation)
    if mod(k,10)==7 %every 10 iterates update the plot
        figure(1);
        imshow(imresize(unvec(x),2,'nearest'),[]);
        title(sprintf('iteration k=%d, delta=%f',k,delta),'fontsize',16);
    end
    if delta < 0.01
        fprintf('reached exit tol at iter %d\n',k);
        break;
    end
    
    
end
%% todo: implement CG algorithm
x = b; 
r = b-A(x);
p = r;
delta = r'*r;
for k=1:5000
    S = A(p);
    alpha = delta/(p'*S);
    x = x + alpha*p;
    r = r - alpha*S;
    prev_delt = delta;
    delta = r'*r;
    p = r+delta/prev_delt*p;
    
    
    
    %visualize current iterate x (comment out to speed up computation)
    if mod(k,10)==2 %every 10 iterates update the plot
        figure(1);
        imshow(imresize(unvec(x),2,'nearest'),[]);
        title(sprintf('iteration k=%d, delta=%f',k,delta),'fontsize',16);
    end

    if delta < 0.01
        fprintf('reached exit tol at iter %d\n',k);
        break;
    end
end
