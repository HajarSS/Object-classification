% 31 August 2012
% Hajar Sadeghi
% Data preparation: Feature Extraction
% Extracting HOG features for test data

cd('./Dataset_Test');

listOfImg= dir('*.png');
numberOfImg= floor(numel(listOfImg)); 

data_test = {}; 
t = cputime;
parfor i = 1:numberOfImg
	fprintf('Image Number: %i ...\n',i);
 	fileName= ['img',int2str(i),'.png'];
	im = imread(fileName); 

	data_test{i} = HOG(im) ;
end
cd ..
e = cputime-t;

fprintf('The used time: %1.2f min\n',e/60);

data_test= cat(2, data_test{:}) ;
save('data_test', 'data_test') ;

