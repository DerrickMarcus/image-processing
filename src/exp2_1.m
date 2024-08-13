% ./src/exp1_3.m

clear;
close all;
clc;

load('./resources/hall.mat');

[height, width] = size(hall_gray);
N = 8;
test = double(hall_gray(height / 2:height / 2 + N - 1, width / 2:width / 2 + N - 1));

% preprocess then transform
res1 = dct2(test - 128);

% transform then process
res2 = dct2(test);
res2(1, 1) = res2(1, 1) - 128 * N;

disp('res1 (preprocess then transform):')
disp(res1);
disp('res2 (transform then process):')
disp(res2);
disp('max error:')
disp(max(max(abs(res1 - res2))));
disp('total error:')
disp(sum(sum(abs(res1 - res2))));
