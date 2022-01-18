%% help simulannealbnd
clc, clear all, close all

%% 用遗传算法求解最小值点和最小值
% 定义匿名函数
fun = @(x)exp(-0.1*x).*sin(x).^2-0.5*(x+0.1).*sin(x);
% 决策变量下限
lb = -10;  
% 决策变量上限
ub = 10;
% 初始值
x0 = 0;

% 全局最优解
[x, fval] = simulannealbnd(fun, x0, lb, ub)