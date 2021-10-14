
konst.alpha = 7;
konst.Beta = 0.3;
konst.gamma = 1/7;

    %           _S__E__I__R__
    % S -> E    |-1| 1| 0| 0|
    % E -> I    | 0|-1| 1| 0|
    % I -> R    | 0| 0|-1| 1|
stoc = @() [
    -1 1 0 0;
    0 -1 1 0;
    0 0 -1 1;
];

prop = @(x, u) [
    x(1)*konst.Beta;
    x(2)*konst.gamma;
    x(3)*konst.alpha;
];

x0 = [
    % S : antalet mottagliga för sjukdomen
    995;
    % I : antalet infekterade
    5;
    0;
    0;
];
span = [0 120];

[t, x] = SSA(prop, stoc, x0, span, prop(x0, 0));

seirPlot = figure;
plot(t, x);