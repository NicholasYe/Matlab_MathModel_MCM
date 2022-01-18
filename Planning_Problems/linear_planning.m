% help linprog
clc, clear all, close all

%% 求优化问题
% min z =-5*x1-4*x2-6*x3 

% x1-x2+x3<=20
% 3*x1+2*x2+4*x3<=42
% 3*x1+2*x2<=30
% 0<=x1, 0<=x2, 0<=x3
% x1+x2+x3=18

% 线性规划系数
f = [-5, -4, -6];
% 条件数组 a*x<=b
a = [1, -1, 1; 3, 2, 4; 3, 2, 0];
b = [20; 42; 30];
% 条件数组 aeq*x=beq
aeq = [1, 1, 1];
beq = 18;
% x1,x2,x3下限
lb = [0; 0; 0];

% 注意，如果是求最大值，f改为-f
[x, fval, exitflag, output] = linprog(f, a, b, aeq, beq, lb, []);