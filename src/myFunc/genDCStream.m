% ./src/myFunc/encodeDCStream.m

function DCstream = genDCStream(dc, DCTAB)

    c_caret = [dc(1), -diff(dc)];
    DCstream = [];

    for i = 1:length(c_caret)
        DCstream = [DCstream, getDCHuffman(c_caret(i), DCTAB), getComplementCode(c_caret(i))];
    end

end
