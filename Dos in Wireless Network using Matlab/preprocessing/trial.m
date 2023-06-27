data = readmatrix('C:/matlab/project/preprocessing/kddcup.csv');
data_norm = zscore(data);
covariance = cov(data_norm);
[eigenvectors, eigenvalues] = eig(covariance);
eigenvalues = diag(eigenvalues);
explained_variance = eigenvalues / sum(eigenvalues);

figure;
plot(explained_variance, 'ro-');
xlabel('Principal Component');
ylabel('Explained Variance');
title('Variance Explained by Principal Components');
data_pca = data_norm * eigenvectors;
[eigenvalues_sorted, i] = sort(eigenvalues, 'descend');
eigenvectors_sorted = eigenvectors(:, i);
data_pca_sorted = data_norm * eigenvectors_sorted;
