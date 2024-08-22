% ./src/myFunc/getDCHuffman.m

function huffman = getDCHuffman(Magnitude, DCTAB)

    if Magnitude == 0
        Category = 0;
    else
        Category = min(floor(log2(abs(Magnitude))) + 1, 11);
    end

    huffman = DCTAB(Category + 1, 2:DCTAB(Category + 1, 1) + 1);

end
