%% help particleswarm
%  particleswarm attempts to solve problems of the form:
%  min F(X)  subject to  LB <= X <= UB
clc, clear all, close all


%% 用粒子群算法求解非线性优化问题
fun = @(x)exp(-0.1*x).*sin(x).^2-0.5*(x+0.1).*sin(x);
nvars = 1; % 决策变量个数
lb = -10;
ub = 10;
[x, fval] = particleswarm(fun, nvars, lb, ub)