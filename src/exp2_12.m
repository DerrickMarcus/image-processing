% ./src/exp2_12.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');

QTAB = QTAB / 2;

encode_res = encodeJPEG(hall_gray, QTAB, DCTAB, ACTAB);
hall_recover = decodeJPEG(encode_res);

figure;

subplot(1, 2, 1);
imshow(hall_gray);
title('Original Image');

subplot(1, 2, 2);
imshow(hall_recover);
title('Recovered Image (halving quantization)');

saveas(gcf, '../report/fig2_12.png');

fprintf('PSNR: %f\n', getPSNR(hall_gray, hall_recover));

[DCstream, ACstream, height, width] = deal(encode_res{1:4});
fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));
