% ./src/myFunc/encodeDCStream.m

function ACstream = genACStream(ac, ACTAB)
    ZRL = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1];
    EOB = [1, 0, 1, 0];
    ACstream = [];

    for i = 1:size(ac, 2)
        zero_num = 0;

        for j = 1:size(ac, 1)

            if ac(j, i) == 0
                zero_num = zero_num + 1;
            else
                zrl_num = floor(zero_num / 16);
                Run = mod(zero_num, 16);
                ACstream = [ACstream, repmat(ZRL, 1, zrl_num), getACHuffman(Run, ac(j, i), ACTAB), getComplementCode(ac(j, i))];
                zero_num = 0;
            end

        end

        ACstream = [ACstream, EOB];

    end

end
