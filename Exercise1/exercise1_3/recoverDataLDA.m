function [X1_rec, X2_rec] = recoverDataLDA(Z1, Z2, v)

% You need to return the following variables correctly.
X1_rec = zeros(size(Z1, 1), length(v));
X2_rec = zeros(size(Z2, 1), length(v));

% ====================== YOUR CODE HERE ======================

X1_rec = Z1*v';
X2_rec = Z2*v';

% =============================================================

end
