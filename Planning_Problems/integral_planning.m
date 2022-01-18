% help intlinprog
clc, clear all, close all

%% 0-1 规划是指自变量Xj仅取值0或者1
% max z = 3*x1-2*x2+5*x3

% x1+2*x2-x3<=2
% x1+4*x2+x3<=4
% x1+x2<=3
% 4*x2+x3<=6
% x1,x2,x3=0,1

% 设定x1~x3约束为整数
intcon = [1, 3];
% 线性规划系数
f = [-3, 2, -5];
% 条件数组 a*x<=b
a = [1, 2, -1; 1, 4, 1; 1, 1, 0; 0, 4, 1];
b = [2; 4; 3; 6];
% 自变量x的上下边界
lb = [0; 0; 0];
ub = [1; 1; 1];
% 条件数组 aeq*x=beq
aeq = [0, 0, 0];
beq = 0;

[x, fval, exitflag, output] = intlinprog(f, intcon, a, b, aeq, beq, lb, ub)


