% ./src/exp3_1.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');

[height, width] = size(hall_gray);
info = randi([0, 1], [height, width]);
hall_hide = double(bitset(hall_gray, 1, info));

encode_res = encodeJPEG(hall_hide, QTAB, DCTAB, ACTAB);
hall_recover = decodeJPEG(encode_res);

info_abstract = double(bitand(hall_recover, 1));

accuracy = sum(sum(info_abstract == info)) / (height * width);
fprintf('accuracy: %f\n', accuracy);

fprintf('PSNR: %f\n', getPSNR(hall_gray, hall_recover));

[DCstream, ACstream] = deal(encode_res{1:2});
fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));
