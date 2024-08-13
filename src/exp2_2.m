% ./src/exp2_2.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');

[height, width] = size(hall_gray);
N = 8;
test = double(hall_gray(height / 2:height / 2 + N - 1, width / 2:width / 2 + N - 1));

% use dct2 in MATLAB
res1 = dct2(test - 128);

% use myDCT written by myself
res2 = myDCT(test - 128);


disp('res1 (dct2):')
disp(res1);
disp('res2 (myDCT):')
disp(res2);
disp('max error:')
disp(max(max(abs(res1 - res2))));
disp('total error:')
disp(sum(sum(abs(res1 - res2))));
