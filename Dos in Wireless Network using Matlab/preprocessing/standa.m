% Perform standardization
x=load('kddcup.mat');
data=x(:,5:end-1);
mu = mean(x); % Compute the mean
sigma = std(x); % Compute the standard deviation
X_std = (x - mu) ./ sigma;

% Print the standardized values
disp(X_std);