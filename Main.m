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

% adding salt and pepper noise using 'imnoise' inbuilt command
noise_added_image=imnoise(image_resize,'salt & pepper',0.2);

% display function
figure,imshow(noise_added_image);
title('Salt and pepper noise added image')

% Noise removal using 'medfilt2' median filter inbuilt command
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