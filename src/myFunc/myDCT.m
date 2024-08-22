% ./src/myFunc/myDCT.m

function C = myDCT(P)
    [M, N] = size(P);
    C = getDmat(M) * P * getDmat(N)';
end
