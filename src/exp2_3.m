% ./src/exp2_3.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');

% test the whole picture
[height, width] = size(hall_gray);
N = min(height, width);
test = double(hall_gray(N / 8:N * 7 / 8 , N / 8:N * 7 / 8));

res1 = myDCT(test - 128);
i_res1 = myIDCT(res1) + 128;

% set the right 4 columns to 0
res2 = res1;
res2(:, end - 3:end) = 0;
i_res2 = myIDCT(res2) + 128;

% set the left 4 columns to 0
res3 = res1;
res3(:, 1:4) = 0;
i_res3 = myIDCT(res3) + 128;

figure;

subplot(1, 3, 1);
imshow(uint8(i_res1));
title('Original Image');

subplot(1, 3, 2);
imshow(uint8(i_res2));
title('Image 1 (set right 0)');

subplot(1, 3, 3);
imshow(uint8(i_res3));
title('Image 2 (set left 0)');

saveas(gcf, '../report/fig2_3_1.png');

% test a small part
N = 8;
test = double(hall_gray(end - N + 1:end, end / 2:end / 2 + N - 1));

res1 = myDCT(test - 128);
i_res1 = myIDCT(res1) + 128;

% set the right 4 columns to 0
res2 = res1;
res2(:, end - 3:end) = 0;
i_res2 = myIDCT(res2) + 128;

% set the left 4 columns to 0
res3 = res1;
res3(:, 1:4) = 0;
i_res3 = myIDCT(res3) + 128;

figure;

subplot(1, 3, 1);
imshow(uint8(i_res1));
title('Original Image');

subplot(1, 3, 2);
imshow(uint8(i_res2));
title('Image 1 (set right 0)');

subplot(1, 3, 3);
imshow(uint8(i_res3));
title('Image 2 (set left 0)');

saveas(gcf, '../report/fig2_3_2.png');
