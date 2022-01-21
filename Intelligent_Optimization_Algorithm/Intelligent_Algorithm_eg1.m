%% 利用多种优化算法求解非线性优化问题
clc, clear all, close all

% 定义目标函数
fun = @(x)-(1+x(1)*sin(4*pi*x(1))+2*x(2)*sin(4*pi*x(2))+(sin(6*sqrt(x(1)^2+2*x(2)^2))/6*sqrt(x(1)^2+x(2)^2+10^(-16))));
% 定义变量范围
rng(2); % 定义种子
x0 = rand(1,2);
lb = [-1, -1];
ub = [1, 1];
A = [];
b = [];
Aeq = [];
beq = [];

%% 用不同算法求解
% 非线性规划
[x1, fval1] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub);
% 遗传算法
[x2, fval2] = ga(fun, 2, A, b, Aeq, beq, lb, ub);
% 退火算法
[x3, fval3] = simulannealbnd(fun, x0, lb, ub);
% 粒子群算法
[x4, fval4] = particleswarm(fun, 2, lb, ub);

%% 作图示意
% 作图
[X, Y] = meshgrid(linspace(-1, 1, 200));
fun2 = @(x,y)1+x.*sin(4*pi*x)+2*y.*sin(4*pi*y)+sin(6*sqrt(x.^2+2*y.^2))./(6*sqrt(x.^2+y.^2+10^(-16)));
Z = fun2(X,Y); % 计算网格点处函数值
surf(X, Y, Z); % 绘制目标函数曲面
shading interp; % 插值染色
camlight; % 添加光源
hold on;

% 标注特殊点
h1 = plot3(x1(1), x1(2), fun2(x1(1),x1(2)),'r*'); % 红色星号
h2 = plot3(x2(1), x2(2), fun2(x2(1),x2(2)),'rp'); % 红色五角星
h3 = plot3(x3(1), x3(2), fun2(x3(1),x3(2)),'r>'); % 红色三角
h4 = plot3(x4(1), x4(2), fun2(x4(1),x4(2)),'ro'); % 红色圆圈

% 添加图例
legend([h1, h2, h3, h4], {'内点法', '遗传算法', '模拟退火算法', '粒子群算法'})
xlabel('x'); ylabel('y'); zlabel('z'); % 坐标轴标签
