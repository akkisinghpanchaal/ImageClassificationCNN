dirData = dir('../CNN_data/Mouth/*.jpg'); %takes all the images from the folder/ you can also assign specific address of the folder
fileNames = {dirData.name};
for k = 1:length(dirData) %the loop will continue for the number of images
    filename = dirData(k).name
    data1 = imread(strcat('../CNN_data/Mouth/',filename));
    data2 = imresize(data1,[96 96]); %w=40, h=30
    iFile = filename
    newName = filename
        imwrite(data2,['../resized_CNN_data/Mouth/', newName,]);
     
   end