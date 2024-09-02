% ./src/exp4_1.m

clear;
close all;
clc;

addpath('./myFunc');

pic_num = 33;

figure;

for L = 3:5
    density = zeros(1, 2 ^ (3 * L));

    for i = 1:pic_num
        image = double(imread(['./resources/Faces/', num2str(i), '.bmp']));
        density = density + getColorDensity(image, L);
    end

    density = density / pic_num;

    subplot(3, 1, L - 2);
    plot(density);
    title(['L = ', num2str(L)]);
end

saveas(gcf, '../report/fig4_1.png');
