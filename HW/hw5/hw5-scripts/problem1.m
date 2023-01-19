%% Load bird migration data table
% data from http://users.stat.ufl.edu/~winner/datasets.html
% accesssed March 7, 2021
% see "bird_migration.txt" for more information about the dataset
load birdmigration
disp(birdmigration{1,5:11}) %show the data table
%% Collect data into predictors matrix A and response vector b
A = birdmigration{1:33,5:11}; %collect predictors into matrix
A = [A, ones(size(A,1),1)];   %add in bias column of all ones
b = birdmigration{1:33,end};  %response vector = migDate
%% Task (a): Compute least squares estimate x_ls
% x_ls = ... (fill in code)
x_ls = A\b;

%% Sort data and show predictions on dataset
[~,ind] = sort(b);
pred = A*x_ls;
figure;
hold on;
scatter(1:length(b),pred(ind));
scatter(1:length(b),b(ind));
hold off;
xlabel('bird species');
ylabel('migDate');
legend('predicted','actual');
%% Task (b): Compute predictions on hold-out set of 5 bird species
A1 = birdmigration{34:38,5:11}; %collect predictors into matrix
A1 = [A1, ones(size(A1,1),1)];  %add in bias column
b1 = birdmigration{34:38,end};  %response vector = migDate

%% Todo: find predictions on hold-out data
%pred1 = ... (fill in code)
pred1 = A1*x_ls;
res = abs(pred1-b1);
disp(res)
mini = min(res);
maxi = max(res);
mean1= mean(res);
disp(strcat("min: ",sprintf('%.6f',mini), " max: ", ...
    sprintf('%.6f',maxi), " mean: ", sprintf('%.6f',mean1)))