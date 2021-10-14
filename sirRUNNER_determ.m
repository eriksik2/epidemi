

konst.Beta = 0.3;
konst.gamma = 1/7;
f = @(x, t) sirSDE(x, t, konst);

y0 = [
    % S : antalet mottagliga för sjukdomen
    995;
    % I : antalet infekterade
    5;
    0;
];
span = [0 120];

[t, x] = ode45(f, span, y0);

sirPlot = figure;
plot(t, x);