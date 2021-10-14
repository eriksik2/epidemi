function [dx] = sirMODEL_determ(t, x, konst)
    % N : storleken på populationen
    % konst.Beta : andelen mottagliga som blir exponerade för smitta per tidsenhet
    % konst.gamma : andelen sjuka som tillfrisknar per tidsenhet
    
    %           _S__I__R__
    % S -> I    |-1| 1| 0|
    % I -> R    | 0|-1| 1|
    

    % S : antalet mottagliga för sjukdomen
    % I : antalet infekterade
    S = x(1);
    I = x(2);
    R = x(3);
    N = sum([S I R]);
    dx = [
        % S'(t)
        -konst.Beta*(I/N)*S;
        % I'(t)
        konst.Beta*(I/N)*S - konst.gamma*I;
        % R'(t)
        konst.gamma*I
    ];
end