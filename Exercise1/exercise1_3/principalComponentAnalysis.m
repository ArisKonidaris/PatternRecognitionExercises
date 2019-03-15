function [U, S] = principalComponentAnalysis(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = principalComponentAnalysis(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE GOES HERE ======================
% Instructions: You should first compute the covariance matrix. Then, 
%  compute the eigenvectors and eigenvalues of the covariance matrix. 
%
% Note that the dataset X is normalized, when calculating the covariance

Cov_Mat  = cov(X);
[U,S] = eig(Cov_Mat);

[S,ind] = sort(diag(S),1,'descend');
S = diag(S);
U = U(:,ind)


% =========================================================================

end
