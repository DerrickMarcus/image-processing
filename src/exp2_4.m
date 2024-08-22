% ./src/exp2_4.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');

% test the whole picture
[height, width] = size(hall_gray);
N = min(height, width);
test = double(hall_gray(end / 2 - N / 2 + 1:end / 2 + N / 2, end / 2 - N / 2 + 1:end / 2 + N / 2));

res1 = myDCT(test - 128);
i_res1 = myIDCT(res1) + 128;

res2 = res1';
i_res2 = myIDCT(res2) + 128;

res3 = rot90(res1);
i_res3 = myIDCT(res3) + 128;

res4 = rot90(res1, 2);
i_res4 = myIDCT(res4) + 128;

figure;

subplot(2, 2, 1);
imshow(uint8(i_res1));
title('Original Image');

subplot(2, 2, 2);
imshow(uint8(i_res2));
title('Image 1 (transpose)');

subplot(2, 2, 3);
imshow(uint8(i_res3));
title('Image 2 (rotate 90)');

subplot(2, 2, 4);
imshow(uint8(i_res4));
title('Image 3 (rotate 180)');

saveas(gcf, '../report/fig2_4_1.png');

% test a small part
N = 8;
test = double(hall_gray(end - N + 1:end, end / 2:end / 2 + N - 1));

res1 = myDCT(test - 128);
i_res1 = myIDCT(res1) + 128;

res2 = res1';
i_res2 = myIDCT(res2) + 128;

res3 = rot90(res1);
i_res3 = myIDCT(res3) + 128;

res4 = rot90(res1, 2);
i_res4 = myIDCT(res4) + 128;

figure;

subplot(2, 2, 1);
imshow(uint8(i_res1));
title('Original Image');

subplot(2, 2, 2);
imshow(uint8(i_res2));
title('Image 1 (transpose)');

subplot(2, 2, 3);
imshow(uint8(i_res3));
title('Image 2 (rotate 90)');

subplot(2, 2, 4);
imshow(uint8(i_res4));
title('Image 3 (rotate 180)');

saveas(gcf, '../report/fig2_4_2.png');
