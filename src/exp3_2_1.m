% ./src/exp3_2_1.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');

[height, width] = size(hall_gray);
H = height / 8;
W = width / 8;

encode = zeros(64, H * W);

for i = 1:H

    for j = 1:W
        temp = double(hall_gray(i * 8 - 7:i * 8, j * 8 - 7:j * 8));
        temp = dct2(temp - 128);
        temp = round(temp ./ QTAB);
        temp = ZigZag_8(temp);
        encode(:, (i - 1) * W + j) = temp';
    end

end

% hide information begin
info = randi([0, 1], size(encode));
encode_hide = double(bitset(uint8(encode), 1, info));
% hide information end

DCstream = genDCStream(encode_hide(1, :), DCTAB);
ACstream = genACStream(encode_hide(2:end, :), ACTAB);

dc_coeff = recDCCoeff(DCstream, DCTAB, height, width);
ac_coeff = recACCoeff(ACstream, ACTAB, height, width);

decode_hide = [dc_coeff; ac_coeff];

hall_recover = zeros(size(hall_gray));

for i = 1:H

    for j = 1:W
        temp = iZigZag_8(decode_hide(:, (i - 1) * W + j));
        temp = round(temp .* QTAB);
        hall_recover(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = idct2(temp) + 128;
    end

end

hall_recover = uint8(hall_recover);

figure;

subplot(1, 2, 1);
imshow(hall_gray);
title('Original Image');

subplot(1, 2, 2);
imshow(hall_recover);
title('Image with hidden method 1');

saveas(gcf, '../report/fig3_2_1.png');

fprintf('PSNR: %f\n', getPSNR(hall_gray, hall_recover));

fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));
