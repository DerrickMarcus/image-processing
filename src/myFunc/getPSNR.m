% ./src/myFunc/getPSNR.m

function PSNR = getPSNR(origin, recovery)
    [height, width] = size(origin);
    MSE = sum(sum((double(origin) - double(recovery)) .^ 2)) / (height * width);
    PSNR = 10 * log10(255 ^ 2 / MSE);
end
