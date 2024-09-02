% ./src/myFunc/getColorDensity.m

function density = getColorDensity(image, L)
    density = zeros(1, 2 ^ (3 * L));

    for i = 1:size(image, 1)

        for j = 1:size(image, 2)
            N = RGBtoN(image(i, j, :), L);
            density(N + 1) = density(N + 1) + 1;
        end

    end

    density = density / sum(density, 'all');
end
 