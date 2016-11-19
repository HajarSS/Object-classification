% 30 Aug 2012
% Hajar Sadeghi
% Preparing data for train and training libSVM     
% --------------------------------------------

% load hists_Train;
load data_train;
data_train= double(data_train);

nCar= 5485;      % the number of cars
nBus= 73;        % the number of buses
nBike= 232;      % the number of bikes
nP= 7892;        % the number of people


nAll= size(data_train,2);
labels= zeros(nAll,1);

r= 1;
labels(r:nCar,1)= 1;         % classification label for car
r= nCar+1;
labels(r:r+nBus-1,1)= 2;     % classification label for people
r= r+nBus;
labels(r:r+nBike-1,1)= 3;    % classification label for bike
r= r+nBike;
labels(r:r+nP-1,1)= 4;       % classification label for bus

% each column in hists contains histogeram values for one image
data= data_train';   % hists contains normalized data
clear data_train;


%Training a svm-Model using training data: 
%-t: RBF as kernel_type, -h:no shrinking, -b:train a SVC or SVR model for probability estimates
t = cputime;
fprintf('Training ...\n');
model_rbf_84_sharp_HOG = svmtrain(labels,data,'-t 2 -h 0 -b 1');
e = cputime-t; 

fprintf('The used time for training: %1.2f min\n',e/60);
save('model_rbf_84_sharp_HOG','model_rbf_84_sharp_HOG');


