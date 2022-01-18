% help fmincon
clc; clear all; close all;

%% 求优化问题
% min z = -(sqrt(x(1))+sqrt(x(2))+sqrt(x(3))+sqrt(x(4)))
x0 = [1; 1; 1; 1];
lb = [0; 0; 0; 0];
ub = [];
A = [];
b = [];
Aeq = [];
beq = [];

[x, fval, exitflag, output] = fmincon(@fun44, x0, A, b, Aeq, beq, lb, ub, @mycon1)

%% 定义目标函数
function f = fun44(x)
f = -(sqrt(x(1))+sqrt(x(2))+sqrt(x(3))+sqrt(x(4)));
end

%% 定义自变量范围
function [g, ceq] = mycon1(x)
g(1) = x(1) - 400;
g(2) = 1.1*x(1) + x(2) - 440;
g(3) = 1.21*x(1) + 1.1*x(2) + x(3) - 484;
g(4) = 1.331*x(1) + 1.21*x(2) + 1.1*x(3) + x(4) - 532.4;
ceq = 0;
end