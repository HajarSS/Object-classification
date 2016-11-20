% 31 August 2012
% Hajar Sadeghi
% Data preparation: Feature Extraction
% Extracting HOG features for test data

% This code is for the test data/ the same code can be used for the train data
cd('./Dataset_Test'); % The directory where all video frames in .png are stored

listOfImg= dir('*.png'); % list of the video frames
numberOfImg= floor(numel(listOfImg)); 

data_test = {};  % a cell to store the test data
t = cputime;
parfor i = 1:numberOfImg   % number of video frames
	fprintf('Image Number: %i ...\n',i);
 	fileName= ['img',int2str(i),'.png'];
	im = imread(fileName); 

	data_test{i} = HOG(im) ;  % extracting HOG features for each video frame
end
cd ..
e = cputime-t;

fprintf('The used time: %1.2f min\n',e/60);

data_test= cat(2, data_test{:}) ;
save('data_test', 'data_test') ;  % saving the test data

