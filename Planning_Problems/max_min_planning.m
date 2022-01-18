%% help fminimax
clc; clear all; close all;

%% 以匿名函数形式编写目标函数
minimaxMyfun = @(x)sqrt([(x(1)-1.5)^2 + (x(2)-6.8)^2;
    (x(1)-6)^2 + (x(2)-7.0)^2;
    (x(1)-8.9)^2 + (x(2)-6.9)^2;
    (x(1)-3.5)^2 + (x(2)-4)^2;
    (x(1)-7.4)^2 + (x(2)-3.1)^2]);

%% 定义自变量范围
x0 = [0.0 ; 0.0];
A = [];
b = [];
Aeq = [1, -1];
beq = 2.5;

%% 函数求解
[x, fval] = fminimax(minimaxMyfun, x0, A, b, Aeq, beq)


