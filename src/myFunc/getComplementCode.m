% ./src/myFunc/getComplementCode.m

function complement = getComplementCode(true_form)

    if true_form == 0
        complement = [];
    else
        complement = double(dec2bin(abs(true_form))) - '0'; % 参考一部分版本和ai

        if true_form < 0
            complement = 1 - complement;
        end

    end

end
