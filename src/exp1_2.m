% ./src/exp1_2.m

clear;
close all;
clc;

load('./resources/hall.mat');

[height, width] = size(hall_gray);
chessboard = hall_color;

h_split = linspace(1, height + 1, 9);
w_split = linspace(1, width + 1, 9);

black_block = zeros(height / 8, width / 8, 3);

for i = 1:8

    for j = 1:8

        if mod(i + j, 2) == 0
            chessboard(h_split(i):h_split(i + 1) - 1, w_split(j):w_split(j + 1) - 1, :) = black_block;
        end

    end

end

imshow(chessboard);
imwrite(chessboard, '../report/fig1_2.jpg');
