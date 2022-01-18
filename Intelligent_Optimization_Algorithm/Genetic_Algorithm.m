%% help ga
clc, clear all, close all

%% 用遗传算法求解最小值点和最小值
fun = @(x)exp(-0.1*x).*sin(x).^2-0.5*(x+0.1).*sin(x);
lb = -10;
ub = 10;
x0 = 0;

% 全局最优解
[x1, fval1] = ga(fun, 1, [], [], [], [], lb, ub);

% 局部最优解
[x2, fval2] = fminbnd(fun, lb, ub);
[x3, fval3] = fmincon(fun, x0, [], [], [], [], lb, ub);
