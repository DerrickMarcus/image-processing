% ./src/myFunc/decodeJPEG.m

function img_recover = decodeJPEG(encode_res)

    [DCstream, ACstream, height, width, QTAB, DCTAB, ACTAB] = deal(encode_res{:});

    dc_coeff = recDCCoeff(DCstream, DCTAB, height, width);
    ac_coeff = recACCoeff(ACstream, ACTAB, height, width);

    decode = [dc_coeff; ac_coeff];

    img_recover = zeros(height, width);
    H = height / 8;
    W = width / 8;

    for i = 1:H

        for j = 1:W
            temp = iZigZag_8(decode(:, (i - 1) * W + j));
            temp = round(temp .* QTAB);
            img_recover(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = idct2(temp) + 128;
        end

    end

    img_recover = uint8(img_recover);

end
