% ./src/myFunc/get_DCT_D.m

% get D operator for matrix with shape of N*N
function D = getD(N)
    D = (1:1:N - 1)' .* (1:2:2 * N - 1);
    D = [sqrt(1/2) * ones(1, N); cos(D * pi / (2 * N))];
    D = D * sqrt(2 / N);
end