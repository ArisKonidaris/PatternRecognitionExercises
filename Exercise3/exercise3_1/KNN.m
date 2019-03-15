% Initialization
clear ; close all; clc

%  We start this exercise by using a small dataset that is easily to
%  visualize
%
fprintf('k-Nearest Neighbours classifier on the Iris dataset.\n\n');

% The k parameter.
k=21;

% Loading the Iris dataset.
X=load ('iris.dat');

% Predictions.
pred=[];
kNN = zeros(k*size(X,1),2);

for i = 1:size(X,1)
    neighbors=zeros(k,2);
    num_of_neighbors=0;
    if (i>1)
        for j=1:i-1
            if (num_of_neighbors<k)
                % Insert a neighbour along with its Euclidean Distance.
                EDist = norm(X(i,1:size(X,2)-1)-X(j,1:size(X,2)-1));
                neighbors(num_of_neighbors+1,1) = EDist;
                neighbors(num_of_neighbors+1,2) = X(j,size(X,2));
                num_of_neighbors = num_of_neighbors+1;
                % When k neighbors are gathered, sort them w.r.t Eucl.Dist.
                if (num_of_neighbors==k)
                    [~,idx] = sort(neighbors(:,1));
                    neighbors = neighbors(idx,:);
                end
            else
                % Check if you have a closer neighbour.
                EDist = norm(X(i,1:size(X,2)-1)-X(j,1:size(X,2)-1));
                if(EDist<neighbors(k,1))
                    % If yes, replace the most distant with the new one.
                    % Then sort again.
                    neighbors(k,:) = [EDist X(j,size(X,2))];
                    [~,idx] = sort(neighbors(:,1));
                    neighbors = neighbors(idx,:);
                end
            end
        end
    end
    if(i<size(X,1))
        for j=i+1:size(X,1)
           if (num_of_neighbors<k)
                % Insert a neighbour along with its Euclidean Distance.
                EDist = norm(X(i,1:size(X,2)-1)-X(j,1:size(X,2)-1));
                neighbors(num_of_neighbors+1,1) = EDist;
                neighbors(num_of_neighbors+1,2) = X(j,size(X,2));
                num_of_neighbors = num_of_neighbors+1;
                % When k neighbors are gathered, sort them w.r.t Eucl.Dist.
                if (num_of_neighbors==k)
                    [~,idx] = sort(neighbors(:,1));
                    neighbors = neighbors(idx,:);
                end
            else
                % Check if you have a closer neighbour.
                EDist=norm(X(i,1:size(X,2)-1)-X(j,1:size(X,2)-1));
                if(EDist<neighbors(k,1))
                    % If yes, replace the most distant with the new one.
                    % Then sort again.
                    neighbors(k,:) = [EDist X(j,size(X,2))];
                    [~,idx] = sort(neighbors(:,1));
                    neighbors = neighbors(idx,:);
                end
            end
        end
    end
    kNN(i*k-k+1:i*k,:)=neighbors;
end

% Creating the prediction vector.
for i=1:size(X,1)
    pr=zeros(1,3);
    for j=1:k
        if(kNN(i*k-k+j,2)==0)
            pr(1,1)=pr(1,1)+1;
        end
        if(kNN(i*k-k+j,2)==1)
            pr(1,2)=pr(1,2)+1;
        end
        if(kNN(i*k-k+j,2)==2)
            pr(1,3)=pr(1,3)+1;
        end
    end
    [~,idx]=max(pr);
    pred=[pred idx-1];
end
pred=pred';

% Calculating the accuracy and the confusion matrix.
correct_predictions=0;
confusion_matrix=zeros(3,3);
for i=1:size(X,1)
    confusion_matrix(X(i,size(X,2))+1,pred(i,1)+1)=...
    confusion_matrix(X(i,size(X,2))+1,pred(i,1)+1)+1;
    if(X(i,size(X,2))==pred(i,1))
        correct_predictions=correct_predictions+1;
    end
end
accuracy=correct_predictions/size(X,1);
disp(['K-Nearest Neighbour accuracy(k=',...
      num2str(k),'): ',num2str(accuracy)]);

% Displaying the confusion matrix.
figure(1)
imagesc(confusion_matrix);
set(gca,'ytick',0:3)
set(gca,'xtick',0:3)
title('Kk-NN Iris Dataset Confusion Matrix');
title('Kk-NN Iris Dataset Confusion Matrix');