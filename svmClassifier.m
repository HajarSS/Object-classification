% 30 Aug 2012
% Preparing data for test and Testing SVM  
% ---------------------------------------

load data_test;           % load the test data
data_test= double(data_test);

load model_rbf_84_sharp_HOG;   % load the trained svm 

nCar= 20;    % number of testing data for car
nBus= 10;    % number of testing data for bus
nBike= 25;   % number of testing data for bike
nP= 50;      % number of testing data for people
  


nAll= nCar+nP+nBike+nBus;
labels= zeros(nAll,1);

r= 1;
labels(r:nCar,1)= 1;       % classification label for car
r= nCar+1;
labels(r:r+nBus-1,1)= 2;   % classification label for bus
r= r+nBus;
labels(r:r+nBike-1,1)= 3;  % classification label for bike
r= r+nBike;
labels(r:r+nP-1,1)= 4;     % classification label for bus

data= data_test';    % hists contains normalized data
clear data_test;

fprintf('Testing ...\n');

% Test a testing set using SVM
[predict_label_L_train, accuracy_L_train, decision_values_train] = svmpredict(labels, data, model_rbf_84_sharp_HOG,'-b 1'); 

