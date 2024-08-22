% ./src/exp2_10.m

clear;
close all;
clc;

load('./jpegcodes.mat');

disp('origin (bits):')
disp(height * width * 8);
disp('DC stream (bits):');
disp(length(DCstream));
disp('AC stream (bits):');
disp(length(ACstream));
disp('compression ratio:');
disp(height * width * 8 / (length(DCstream) + length(ACstream)));
