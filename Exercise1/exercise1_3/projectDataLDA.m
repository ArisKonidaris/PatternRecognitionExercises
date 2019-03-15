function [Z1, Z2] = projectDataLDA(X1, X2, v)

% You need to return the following variables correctly.
Z1 = zeros(size(X1, 1), 1);
Z2 = zeros(size(X2, 1), 1);

% ====================== YOUR CODE HERE ======================

Z1 = X1*v;
Z2 = X2*v;

% =============================================================

end
