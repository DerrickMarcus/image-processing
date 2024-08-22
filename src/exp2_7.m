% ./src/exp2_7.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');

N = 8;
test = double(hall_gray(end - N + 1:end, end / 2:end / 2 + N - 1));

test_zz = ZigZag_8(test);

disp('test:');
disp(test);
disp('test after Zig-Zag:');
disp(test_zz);
