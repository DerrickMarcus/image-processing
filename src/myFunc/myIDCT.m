% ./src/myFunc/myIDCT.m

function P = myIDCT(C)
    [M, N] = size(C);
    P = getDmat(M)' * C * getDmat(N);
end
