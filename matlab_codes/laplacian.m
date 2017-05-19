dirData = dir('../CNN_data/Mouth/*.jpg'); %takes all the images from the folder/ you can also assign specific address of the folder
fileNames = {dirData.name};
for k = 1:length(dirData) %the loop will continue for the number of images
    filename = dirData(k).name
    data1 = imread(strcat('../CNN_data/Mouth/',filename));
    data2 = rgb2gray(data1);
    data3 = imresize(data2,[96 96]); %w=40, h=30
    lp = fspecial('laplacian');
    data4 = imfilter(data3,lp);
    iFile = filename
    newName = filename
    imwrite(data4,['../resized_CNN_data/laplacian/Mouth/', newName,]); 
end