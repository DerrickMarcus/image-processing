% ./src/exp3_2.m

clear;
close all;
clc;

addpath('./myFunc');

load('./resources/hall.mat');
load('./resources/JpegCoeff.mat');

figure;

subplot(2, 2, 1);
imshow(hall_gray);
title('Original Image');

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

% hide information method 1 begin
info = randi([0, 1], size(encode));
encode_hide_1 = double(bitset(uint8(encode), 1, info));

DCstream = genDCStream(encode_hide_1(1, :), DCTAB);
ACstream = genACStream(encode_hide_1(2:end, :), ACTAB);

dc_coeff = recDCCoeff(DCstream, DCTAB, height, width);
ac_coeff = recACCoeff(ACstream, ACTAB, height, width);

decode_hide = [dc_coeff; ac_coeff];

hall_recover_1 = zeros(size(hall_gray));

for i = 1:H

    for j = 1:W
        temp = iZigZag_8(decode_hide(:, (i - 1) * W + j));
        temp = round(temp .* QTAB);
        hall_recover_1(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = idct2(temp) + 128;
    end

end

hall_recover_1 = uint8(hall_recover_1);

subplot(2, 2, 2);
imshow(hall_recover_1);
title('Image with hidden method 1');

fprintf('Method 1:\n');
fprintf('PSNR: %f\n', getPSNR(hall_gray, hall_recover_1));
fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));

% hide information method 2 begin
[~, hidden_idx] = min(ZigZag_8(QTAB));
info = randi([0, 1], [length(hidden_idx), size(encode, 2)]);
encode_hide_2 = encode;
encode_hide_2(hidden_idx, :) = double(bitset(uint8(encode(hidden_idx, :)), 1, info));

DCstream = genDCStream(encode_hide_2(1, :), DCTAB);
ACstream = genACStream(encode_hide_2(2:end, :), ACTAB);

dc_coeff = recDCCoeff(DCstream, DCTAB, height, width);
ac_coeff = recACCoeff(ACstream, ACTAB, height, width);

decode_hide = [dc_coeff; ac_coeff];

hall_recover_2 = zeros(size(hall_gray));

for i = 1:H

    for j = 1:W
        temp = iZigZag_8(decode_hide(:, (i - 1) * W + j));
        temp = round(temp .* QTAB);
        hall_recover_2(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = idct2(temp) + 128;
    end

end

hall_recover_2 = uint8(hall_recover_2);

subplot(2, 2, 3);
imshow(hall_recover_2);
title('Image with hidden method 2');

fprintf('Method 2:\n');
fprintf('PSNR: %f\n', getPSNR(hall_gray, hall_recover_2));
fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));

% hide information method 3 begin
info = randi([0, 1], [1, size(encode, 2)]);
info(info == 0) = -1;
encode_hide_3 = encode;

for i = 1:size(encode_hide_3, 2)

    for j = size(encode_hide_3, 1):-1:1

        if encode_hide_3(j, i) ~= 0

            if j == size(encode_hide_3, 1)
                encode_hide_3(j, i) = info(i);
            else
                encode_hide_3(j + 1, i) = info(i);
            end

            break;

        end

    end

end

DCstream = genDCStream(encode_hide_3(1, :), DCTAB);
ACstream = genACStream(encode_hide_3(2:end, :), ACTAB);

dc_coeff = recDCCoeff(DCstream, DCTAB, height, width);
ac_coeff = recACCoeff(ACstream, ACTAB, height, width);

decode_hide = [dc_coeff; ac_coeff];

hall_recover_3 = zeros(height, width);

for i = 1:H

    for j = 1:W
        temp = iZigZag_8(decode_hide(:, (i - 1) * W + j));
        temp = round(temp .* QTAB);
        hall_recover_3(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = idct2(temp) + 128;
    end

end

hall_recover_3 = uint8(hall_recover_3);

subplot(2, 2, 4);
imshow(hall_recover_3);
title('Image with hidden method 3');

fprintf('Method 3:\n');
fprintf('PSNR: %f\n', getPSNR(hall_gray, hall_recover_3));
fprintf('compression ratio: %f\n', height * width * 8 / (length(DCstream) + length(ACstream)));

saveas(gcf, '../report/fig3_2.png');
