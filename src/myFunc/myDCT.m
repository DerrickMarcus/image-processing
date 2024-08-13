% ./src/myFunc/myDCT.m

function C = myDCT(P)
    [M, N] = size(P);
    C = getD(M) * P * getD(N)';
end