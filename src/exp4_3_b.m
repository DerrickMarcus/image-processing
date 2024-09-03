% ./src/exp4_3_b.m

clear;
close all;
clc;

addpath('./myFunc');

% get faces color density begin
pic_num = 33;
L = 5;
std_density = zeros(1, 2 ^ (3 * L));

for i = 1:pic_num
    image = double(imread(['./resources/Faces/', num2str(i), '.bmp']));
    std_density = std_density + getColorDensity(image, L);
end

std_density = std_density / pic_num;
% get faces color density end

threshold = 0.55;
region_size = [200, 200];
step_size = [100, 100];

test_image = imread('./resources/test.bmp');
% stretch
test_image = imresize(test_image, [size(test_image, 1), size(test_image, 2) * 2]);
test_image = double(test_image);
[test_height, test_width, ~] = size(test_image);

face_regions = [];

% scan for face regions begin
for i = 1:step_size(1):test_height - region_size(1) + 1

    for j = 1:step_size(2):test_width - region_size(2) + 1

        current_region = test_image(i:i + region_size(1) - 1, j:j + region_size(2) - 1, :);
        current_density = getColorDensity(current_region, L);
        distance = 1 - sum(sqrt(std_density .* current_density), 'all');

        if distance < threshold
            face_regions = [face_regions; i, j, i + region_size(1) - 1, j + region_size(2) - 1];
        end

    end

end

% scan for face regions end

% merge face regions begin
% 此部分参考ai语言模型，调整后写出算法
merged_regions = [];

while ~isempty(face_regions)
    current_box = face_regions(1, :);
    face_regions(1, :) = [];
    overlap = false;

    for j = 1:size(merged_regions, 1)
        merged_box = merged_regions(j, :);

        if ~((current_box(3) < merged_box(1)) || ...
                (current_box(4) < merged_box(2)) || ...
                (current_box(1) > merged_box(3)) || ...
                (current_box(2) > merged_box(4)))

            merged_box(1) = min(merged_box(1), current_box(1));
            merged_box(2) = min(merged_box(2), current_box(2));
            merged_box(3) = max(merged_box(3), current_box(3));
            merged_box(4) = max(merged_box(4), current_box(4));
            merged_regions(j, :) = merged_box;
            overlap = true;
            break;
        end

    end

    if ~overlap
        merged_regions = [merged_regions; current_box];
    else
        i = 1;

        while i <= size(merged_regions, 1)
            j = i + 1;

            while j <= size(merged_regions, 1)
                box1 = merged_regions(i, :);
                box2 = merged_regions(j, :);

                if ~((box1(3) < box2(1)) || ...
                        (box1(4) < box2(2)) || ...
                        (box1(1) > box2(3)) || ...
                        (box1(2) > box2(4)))

                    merged_box(1) = min(box1(1), box2(1));
                    merged_box(2) = min(box1(2), box2(2));
                    merged_box(3) = max(box1(3), box2(3));
                    merged_box(4) = max(box1(4), box2(4));
                    merged_regions(i, :) = merged_box;
                    merged_regions(j, :) = [];
                else
                    j = j + 1;
                end

            end

            i = i + 1;
        end

    end

end

% merge face regions end

% adjust regions shape begin
for i = 1:size(merged_regions, 1)
    dx = merged_regions(i, 3) - merged_regions(i, 1);
    dy = merged_regions(i, 4) - merged_regions(i, 2);

    if dx / dy > 4/3
        new_dx = 4 * round(sqrt(dx * dy / 12));
        new_dy = 3 * round(sqrt(dx * dy / 12));
        merged_regions(i, 1) = merged_regions(i, 1) + (dx - new_dx) / 2;
        merged_regions(i, 3) = merged_regions(i, 3) - (dx - new_dx) / 2;
        merged_regions(i, 2) = max(1, merged_regions(i, 2) - (new_dy - dy) / 2);
        merged_regions(i, 4) = min(test_width, merged_regions(i, 4) + (new_dy - dy) / 2);
    elseif dy / dx > 4/3
        new_dx = 3 * round(sqrt(dx * dy / 12));
        new_dy = 4 * round(sqrt(dx * dy / 12));
        merged_regions(i, 1) = max(1, merged_regions(i, 1) - (new_dx - dx) / 2);
        merged_regions(i, 3) = min(test_height, merged_regions(i, 3) + (new_dx - dx) / 2);
        merged_regions(i, 2) = merged_regions(i, 2) + (dy - new_dy) / 2;
        merged_regions(i, 4) = merged_regions(i, 4) - (dy - new_dy) / 2;
    end

end

% adjust regions shape end

figure;
imshow(uint8(test_image));
hold on;

for i = 1:size(merged_regions, 1)
    y_min = merged_regions(i, 1);
    x_min = merged_regions(i, 2);
    y_max = merged_regions(i, 3);
    x_max = merged_regions(i, 4);
    rectangle('Position', [x_min, y_min, x_max - x_min + 1, y_max - y_min + 1], ...
        'EdgeColor', 'r', 'LineWidth', 1);
end

hold off;
saveas(gcf, '../report/fig4_3_b.png');
