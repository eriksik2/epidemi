
konst.Beta = 0.3;
konst.gamma = 1/7;


    %           _S__I__R__
    % S -> I    |-1| 1| 0|
    % I -> R    | 0|-1| 1|
stoc = @() [
    -1 1 0;
    0 -1 1;
];

prop = @(x, u) [
    x(1)*konst.Beta;
    x(2)*konst.gamma;
];

x0 = [
    % S : antalet mottagliga för sjukdomen
    99;
    % I : antalet infekterade
    1;
    0;
];
span = [0 120];

[t, x] = SSA(prop, stoc, x0, span, prop(x0, 0));

seirPlot = figure;
plot(t, x);