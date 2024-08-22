% ./src/exp1_3.m

clear;
close all;
clc;

load('./resources/hall.mat');


N = 8;
test = double(hall_gray(end / 2:end / 2 + N - 1, end / 2:end / 2 + N - 1));

% preprocess then transform
res1 = dct2(test - 128);

% transform then process
res2 = dct2(test);
res2(1, 1) = res2(1, 1) - 128 * N;

disp('res1 (preprocess then transform):');
disp(res1);
disp('res2 (transform then process):');
disp(res2);
disp('max error:');
disp(max(max(abs(res1 - res2))));
disp('total error:');
disp(sum(sum(abs(res1 - res2))));
