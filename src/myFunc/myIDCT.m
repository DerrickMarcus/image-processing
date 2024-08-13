% ./src/myFunc/myIDCT.m

function P = myIDCT(C)
    [M, N] = size(C);
    P = getD(M)' * C * getD(N);
end