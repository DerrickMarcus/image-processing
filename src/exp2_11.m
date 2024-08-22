% ./src/exp2_11.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');
load('./jpegcodes.mat');

hall_recover = decodeJPEG({DCstream, ACstream, height, width, QTAB, DCTAB, ACTAB});

subplot(1, 2, 1);
imshow(hall_gray);
title('Original Image');

subplot(1, 2, 2);
imshow(hall_recover);
title('Recovered Image');

saveas(gcf, '../report/fig2_11.png');

fprintf('PSNR = %f\n', getPSNR(hall_gray, hall_recover));

fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));
