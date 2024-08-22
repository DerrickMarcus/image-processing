% ./src/myFunc/encodeJPEG.m

function encode_res = encodeJPEG(img_original, QTAB, DCTAB, ACTAB)

    [height, width] = size(img_original);
    H = height / 8;
    W = width / 8;

    encode = zeros(64, H * W);

    for i = 1:H

        for j = 1:W
            temp = double(img_original(i * 8 - 7:i * 8, j * 8 - 7:j * 8));
            temp = dct2(temp - 128);
            temp = round(temp ./ QTAB);
            temp = ZigZag_8(temp);
            encode(:, (i - 1) * W + j) = temp';
        end

    end

    DCstream = genDCStream(encode(1, :), DCTAB);
    ACstream = genACStream(encode(2:end, :), ACTAB);

    encode_res = {DCstream, ACstream, height, width, QTAB, DCTAB, ACTAB};

end
