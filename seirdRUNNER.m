
konst.alpha = 7;
konst.Beta = 0.3;
konst.gamma = 1/7;
konst.mikro = 0.03;

    %           _S__E__I__R__D
    % S -> E    |-1| 1| 0| 0| 0
    % E -> I    | 0|-1| 1| 0| 0
    % I -> R    | 0| 0|-1| 1| 0
    % I -> D    | 0| 0|-1| 0| 1
stoc = @() [
    -1 1 0 0 0;
    0 -1 1 0 0;
    0 0 -1 1 0;
    0 0 -1 0 1;
];

prop = @(x, u) [
    x(1)*konst.Beta;
    x(2)*konst.gamma;
    x(3)*konst.alpha;
    x(3)*konst.mikro;
];

x0 = [
    % S : antalet mottagliga för sjukdomen
    995;
    % I : antalet infekterade
    5;
    0;
    0;
    0;
];
span = [0 120];

[t, x] = SSA(prop, stoc, x0, span, prop(x0, 0));

seirPlot = figure;
plot(t, x);
legend(["Healthy" "Exposed" "Infected" "Recovered" "Dead"]);