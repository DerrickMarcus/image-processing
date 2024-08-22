% ./src/exp1_1.m

clear;
close all;
clc;

load('./resources/hall.mat');

[height, width] = size(hall_gray);
radius = min(height, width) / 2;
center = [height / 2, width / 2];

img_with_circle = hall_color;

for i = 1:height

    for j = 1:width
        distance = sqrt((i - center(1)) ^ 2 + (j - center(2)) ^ 2);

        if abs(distance / radius - 1) < 0.02
            img_with_circle(i, j, :) = [255, 0, 0];
        end

    end

end

imshow(img_with_circle);
imwrite(img_with_circle, '../report/fig1_1.jpg');
