% ./src/myFunc/getACHuffman.m

function huffman = getACHuffman(Run, Amplitude, ACTAB)

    if Amplitude == 0
        Size = 0;
    else
        Size = min(floor(log2(abs(Amplitude))) + 1, 10);
    end

    len = Run * 10 + Size;
    huffman = ACTAB(len, 4:ACTAB(len, 3) + 3);

end
