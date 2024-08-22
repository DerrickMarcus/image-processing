% ./src/exp2_13.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/snow.mat');
load('./resources/JpegCoeff.mat');

encode_res = encodeJPEG(snow, QTAB, DCTAB, ACTAB);
snow_recover = decodeJPEG(encode_res);

figure;

subplot(1, 2, 1);
imshow(snow);
title('Original Image: snow');

subplot(1, 2, 2);
imshow(snow_recover);
title('Recovered Image: snow');

saveas(gcf, '../report/fig2_13.png');

fprintf('PSNR: %f\n', getPSNR(snow, snow_recover));

[DCstream, ACstream, height, width] = deal(encode_res{1:4});
fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));
