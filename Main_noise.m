% clearing command window
clc
% cleaning all variable
clear
% closing all figure
close all

% read inbuilt image from matlab
input_image=imread('football.jpg');

% display function
figure,imshow(input_image);
title('Original RGB image')

% Convert RGB image to gray image
gray_image=rgb2gray(input_image);

% display function
figure,imshow(gray_image);
title('Gray image')

% resize the image
image_resize=imresize(gray_image,[256,256]);

% display function
figure,imshow(image_resize);
title('Resized image')

% Noise added using user defined function

% generating random values with respect to image size
q = rand(size(image_resize));
% noise percentage [0.1 to 0.9]
noise_per=0.2;
for i=1:256
    for j=1:256
            if (q(i,j) < noise_per)
            valueset = [0, 255];
            temp=valueset(randi(numel(valueset)));
            % if generate random noise is 255 means, add white noise
            if(temp==255)
                noise_added_image(i,j)=255;
            else
            % if generate random noise is 0 means, add black noise
                noise_added_image(i,j)=0;
            end
        else
            noise_added_image(i,j)=image_resize(i,j);            
        end
    end
end

% display function
figure,imshow(noise_added_image);
title('Salt and pepper noise added image')

% Noise removal using median filter
noise_removed_image=medfilt2(noise_added_image,[3,3]);

% display function
figure,imshow(noise_removed_image);
title('Salt and pepper noise removed image')
% Median filter Performance
% Mean squared error
mse_value=mse(image_resize,noise_removed_image)
% Structural Similarity Index
ssim_value=ssim(image_resize,noise_removed_image)
% Peak Signal-To-Noise Ratio
psnr_vale=psnr(image_resize,noise_removed_image)

