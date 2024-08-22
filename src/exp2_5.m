% ./src/exp2_5.m

clear;
close all;
clc;

a = 1;
b = [-1 1];
freqz(b, a);

saveas(gcf, '../report/fig2_5.png');
