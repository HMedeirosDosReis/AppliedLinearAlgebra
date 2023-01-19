matrix3_7A = [1 2; 0 2];
matrix4_1aA = [3 0; 0 -2];
matrix4_1bA = [2 0; 0 3];
matrix4_1dA = [1 1; 0 0];
matrix4_1eA = [1 1; 1 1];
arrayOfMatrices ={ matrix3_7A};
arrayOfMatrices{2} = matrix4_1aA;
arrayOfMatrices{3} = matrix4_1bA;
arrayOfMatrices{4} = matrix4_1dA;
arrayOfMatrices{5} = matrix4_1eA;
for i= 1:length(arrayOfMatrices)
    PlotCircleEllipse(arrayOfMatrices{i},i)
end


function PlotCircleEllipse(A, i)
if ~exist('i', 'var')
    i=1;
end
%get the svd of A
[U, Sigma, V] = svd(A);

%------ Start with the unit circle
% Grab all values between 0 and 2pi increasing by 0.01
t=0:0.01:(2*pi);
% Grab all values between 0 and 1 increasing by 0.1
ZeroToOne=0:0.1:1;
% x and y for all values of t
xCircle = cos(t);
yCircle = sin(t);
% Separate the vectors that will construct the lines in the circle, by using
% the right singular values
CircleVector1 = V(:,1);
CircleVector2 = V(:,2);
% Plot
figure(i);
plot(xCircle, yCircle, 'k');
hold on;
plot(CircleVector1(1)*ZeroToOne, CircleVector1(2)*ZeroToOne, 'b', 'LineWidth',2);
hold on;
plot(CircleVector2(1)*ZeroToOne, CircleVector2(2)*ZeroToOne, 'y','LineWidth',2);
grid on;
title('Before multiplying by A');
xlim([-5 5])
ylim([-5 5])

%------ Now create the ellipse 
% The ellipse is A multiplied with the unit circle
ATimesCircle = A*[xCircle;yCircle];
% x and y for the Ellipse
xEllipse = ATimesCircle(1,:);
yEllipse = ATimesCircle(2,:);
% Separate the vectors that will construct the lines in the ellipse, by using
% the left singular values multiplied with the actual singular values, so
% that it scales properly
ellipseVector1 = Sigma(1,1)*U(:,1);
ellipseVector2 = Sigma(2,2)*U(:,2);

% Plot the ellipse
figure(i+10);
plot(xEllipse, yEllipse, 'k');
hold on;
plot(ellipseVector1(1)*ZeroToOne, ellipseVector1(2)*ZeroToOne, 'b','LineWidth',2);
hold on;
plot(ellipseVector2(1)*ZeroToOne, ellipseVector2(2)*ZeroToOne, 'y','LineWidth',2);
grid on;
title('After Multiplying by A');
xlim([-5 5])
ylim([-5 5])
end 

