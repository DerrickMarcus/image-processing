% ./src/myFunc/recDCCoeff.m

function dc_coeff = recDCCoeff(DCstream, DCTAB, height, width)

    H = height / 8;
    W = width / 8;
    dc_coeff = zeros(1, H * W);

    cur_loc = 1;
    i = 1;

    while i <= size(DCstream, 2)

        for j = 1:size(DCTAB, 1)

            huff_len = DCTAB(j, 1);

            if i + huff_len - 1 <= size(DCstream, 2) && isequal(DCstream(i:i + huff_len - 1), DCTAB(j, 2:huff_len + 1))
                Category = j - 1;
                i = i + huff_len;

                if Category == 0
                    dc_coeff(cur_loc) = 0;
                else
                    Magnitude = DCstream(i:i + Category - 1);
                    dc_coeff(cur_loc) = getTrueForm(Magnitude);
                end

                i = i + Category;
                break;
            end

        end

        cur_loc = cur_loc + 1;
    end

    dc_coeff = cumsum([dc_coeff(1), -dc_coeff(2:end)]);
end
