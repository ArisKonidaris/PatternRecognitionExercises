%% Pattern Recognition
%  Exercise 1.3 | Linear Discriminant Analysis
%
%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  exercise. You will need to complete the following functions:
%
%     principalComponentAnalysis.m
%     projectData.m
%     recoverData.m
%
%  For this exercise, you will not need to change the code in file fisherLinearDiscriminant.m
%

%% Initialization
clear ; close all; clc

%% ================== Part 1: Load Example Dataset  ===================
%  We start this exercise by using a small dataset that is easily to
%  visualize
%
fprintf('Visualizing example dataset for LDA.\n\n');

%  The following command loads the dataset. You should now have the 
%  variable X in your environment
load ('ex1_3_data1.mat');

%  Before running PCA, it is important to first normalize X
[X_norm, mu, sigma] = featureNormalize(X);

X1 = X_norm(c==1, :);
X2 = X_norm(c==2, :);

%  Visualize the example dataset
figure(1)
hold on
plot(X1(:, 1), X1(:, 2), 'bo');
plot(X2(:, 1), X2(:, 2), 'rs');
axis([-2.1 2.1 -2.1 2.1]); axis square;
hold off

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =============== Part 2: Fisher Linear Discriminant =============
% 
%

v = fisherLinearDiscriminant(X1, X2);


hold on
drawLine(-5*v', 5*v', '-g', 'LineWidth', 1);
hold off

fprintf('Program paused. Press enter to continue.\n');
pause;

%  Project the data onto the direction of the one dimensional vector v
[Z1, Z2] = projectDataLDA(X1, X2, v);

% Reconstruct the data on the line defined by vector v
[X1_rec, X2_rec]  = recoverDataLDA(Z1, Z2, v);


%  Draw lines connecting the projected points to the original points
fprintf('\nDisplaying LDA on example dataset.\n\n');
hold on;
plot(X1_rec(:, 1), X1_rec(:, 2), 'bo', 'MarkerFaceColor', 'b');
for i = 1:size(X1, 1)
    drawLine(X1(i,:), X1_rec(i,:), '--k', 'LineWidth', 1);
end

plot(X2_rec(:, 1), X2_rec(:, 2), 'rs', 'MarkerFaceColor', 'r');
for i = 1:size(X2, 1)
    drawLine(X2(i,:), X2_rec(i,:), '--k', 'LineWidth', 1);
end
hold off

fprintf('Program paused. Press enter to continue.\n');
pause;



%% =============== Part 3: Principal Component Analysis ===============

fprintf('\nRunning PCA on example dataset.\n\n');

%  Run PCA
[U, S] = principalComponentAnalysis(X_norm);


%  Project the data onto K = 1 dimension
K = 1;
Z = projectDataPCA(X_norm, U, K);

X_rec  = recoverDataPCA(Z, U, K);

%  Plot the normalized dataset (returned from principalComponentAnalysis)
%  Draw lines connecting the projected points to the original points
fprintf('\nVisualizing example dataset for PCA.\n\n');
figure(2)
hold on;
axis([-2.1 2.1 -2.1 2.1]); axis square;
drawLine(-2.3*U(:,1), 2.3*U(:,1), '-g', 'LineWidth', 1);
plot(X1(:, 1), X1(:, 2), 'bo');
plot(X2(:, 1), X2(:, 2), 'rs');
plot(X_rec(c==1, 1), X_rec(c==1, 2), 'bo', 'MarkerFaceColor', 'b');
plot(X_rec(c==2, 1), X_rec(c==2, 2), 'rs', 'MarkerFaceColor', 'r');
for i = 1:size(X_norm, 1)
    drawLine(X_norm(i,:), X_rec(i,:), '--k', 'LineWidth', 1);
end
hold off






