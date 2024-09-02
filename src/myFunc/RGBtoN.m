% ./src/myFunc/RGBtoN.m

function N = RGBtoN(RGB, L)
    R = floor(RGB(1) / 2 ^ (8 - L));
    G = floor(RGB(2) / 2 ^ (8 - L));
    B = floor(RGB(3) / 2 ^ (8 - L));
    N = R * 2 ^ (2 * L) + G * 2 ^ L + B;
end
