% ./src/exp2_9.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');

encode_res = encodeJPEG(hall_gray, QTAB, DCTAB, ACTAB);

[DCstream, ACstream, height, width] = deal(encode_res{1:4});

save('jpegcodes.mat', 'DCstream', 'ACstream', 'height', 'width');
