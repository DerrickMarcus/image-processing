% ./src/myFunc/recACCoeff.m

function ac_coeff = recACCoeff(ACstream, ACTAB, height, width)

    H = height / 8;
    W = width / 8;
    ac_coeff = zeros(64 - 1, H * W);

    ZRL = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1];
    EOB = [1, 0, 1, 0];

    cur_row = 1; % current row
    cur_column = 1; % current column
    i = 1;

    while i <= size(ACstream, 2)

        if isequal(ACstream(i:i + length(EOB) - 1), EOB)
            cur_column = cur_column + 1;
            cur_row = 1;
            i = i + length(EOB);

        elseif i + length(ZRL) - 1 <= size(ACstream, 2) && isequal(ACstream(i:i + length(ZRL) - 1), ZRL)
            cur_row = cur_row + 16;
            i = i + length(ZRL);

        else

            for j = 1:size(ACTAB, 1)
                huff_len = ACTAB(j, 3);

                if i + huff_len - 1 <= size(ACstream, 2) & isequal(ACstream(i:i + huff_len - 1), ACTAB(j, 4:huff_len + 3))
                    Run = ACTAB(j, 1);
                    Size = ACTAB(j, 2);
                    cur_row = cur_row + Run;
                    i = i + huff_len;

                    if Size == 0
                        ac_coeff(cur_row, cur_column) = 0;
                    else
                        Amplitude = ACstream(i:i + Size - 1);
                        ac_coeff(cur_row, cur_column) = getTrueForm(Amplitude);
                    end

                    i = i + Size;
                    cur_row = cur_row + 1;
                    break;
                end

            end

        end

    end

end
