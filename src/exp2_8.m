% ./src/exp2_8.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');

[height, width] = size(hall_gray);
H = height / 8;
W = width / 8;
result = zeros(64, H * W);
loc = 1;

for i = 1:H

    for j = 1:W
        test = double(hall_gray(i * 8 - 7:i * 8, j * 8 - 7:j * 8));
        test = dct2(test - 128);
        test = round(test ./ QTAB);
        test = ZigZag_8(test);
        result(:, loc) = test';
        loc = loc + 1;
    end

end
