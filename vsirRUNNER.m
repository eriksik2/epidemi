
konst.sigma = 0.03;
konst.Beta = 0.3;
konst.gamma = 1/7;


    %           _S__V__I__R__
    % S -> I    |-1|0| 1| 0|
    % S -> V    |-1|1| 0| 0|
    % I -> R    | 0|0|-1| 1|
stoc = @() [
    -1 0 1 0;
    -1 1 0 0;
    0 0 -1 1;
];

prop = @(x, u) [
    x(1)*konst.Beta;
    x(1)*konst.sigma;
    x(3)*konst.gamma;
];

x0 = [
    % S : antalet mottagliga för sjukdomen
    995;
    % I : antalet infekterade
    0;
    5;
    0;
];
span = [0 120];

[t, x] = SSA(prop, stoc, x0, span, prop(x0, 0));

seirPlot = figure;
plot(t, x);
legend(["Healthy" "Vax" "Infected" "Recovered"]);