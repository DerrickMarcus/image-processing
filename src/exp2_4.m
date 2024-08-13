% ./src/exp2_4.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');

% [height, width] = size(hall_gray);
% N = 8;
% test = double(hall_gray(height / 2:height / 2 + N - 1, width / 2:width / 2 + N - 1));
test = double(hall_gray);

res1 = myDCT(test - 128);
i_res1 = myIDCT(res1) + 128;