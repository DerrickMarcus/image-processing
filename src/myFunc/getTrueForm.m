% ./src/myFunc/getTrueForm.m

function true_form = getTrueForm(complement)

    if complement(1) == 1
        true_form = bin2dec(char(complement + '0'));
    else
        complement = 1 - complement;
        true_form = -bin2dec(char(complement + '0'));
    end

end