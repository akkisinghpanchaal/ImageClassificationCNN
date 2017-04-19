%f_path = '/media/akkisinghpanchaal/bbeb802a-c5a6-44fa-8e78-00a57e8aee07/akshay_backup/akshay2/SEM-VII/IndependentStudy/Data/babies_v4/';
f_path = '../babies_images_edited/'
folder = dir(strcat(f_path,'*.jpg'));
%nf_path = '/media/akkisinghpanchaal/bbeb802a-c5a6-44fa-8e78-00a57e8aee07/akshay_backup/akshay2/SEM-VIII/IS/ImageClassificationCNN/CNN_data/'
nf_path = '../CNN_data/'
%faceDetector = vision.CascadeObjectDetector;
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16); 
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16); 
EyeDetect = vision.CascadeObjectDetector('EyePairBig'); 

for i = 1 : length(folder)
    folder(i).name
    I = imread(strcat(f_path,folder(i).name));
    
    eyes = step(EyeDetect,I)
    if isempty(eyes)
        strcat('eyes not found for ', folder(i).name)
        imshow(I)
        eyes = getrect
        close all;
    else
        eyes = imcrop(I,eyes(1,:));
        imshow(eyes)
    end
    imwrite(eyes,strcat(nf_path,'Eyes/eyes_',folder(i).name));
    
    nose = step(NoseDetect,I)
    if isempty(nose)
        strcat('nose not found for ', folder(i).name)
        imshow(I)
        nose = getrect
        close all;
    else
        nose = imcrop(I,nose(1,:));
        imshow(nose)
    end
    imwrite(nose,strcat(nf_path,'Nose/nose_',folder(i).name));
    
    mouth = step(MouthDetect,I)
    if isempty(mouth)
        strcat('mouth not found for ', folder(i).name)
        imshow(I)
        mouth = getrect
        close all;
    else
        mouth = imcrop(I,mouth(1,:));
        imshow(mouth)
    end
    imwrite(mouth,strcat(nf_path,'Mouth/mouth_',folder(i).name));
end
