clc, clear all, close all

%% 数据准备
x= [23.80, 27.60, 31.60, 32.4, 33.7, 34.9, 43.2, 52.8, 63.8, 73.4];
y= [41.4, 51.8, 61.7, 67.9, 68.7, 77.5, 95.9, 137.4, 155, 175];
figure
plot(x,y,'r*')
xlabel('x(职工工资总额)', 'FontSize', 12)
ylabel('y(商品零售总额)', 'FontSize', 12)
set(gca, 'linewidth', 2);

%% 采用最小二乘拟合
Lxx = sum((x-mean(x)).^2);
Lxy = sum((x-mean(x)).*(y-mean(y)));
b1 = Lxy/Lxx;
b0 = mean(y)- b1*mean(x);
y1 = b1*x + b0;
hold on
plot(x, y1, 'LineWidth',2)

%% 采用LinearModel.fit函数进行线性回归
m2 = LinearModel.fit(x,y)

%% 采用regress函数进行回归
Y = y';
X = [ones(size(x,2),1),x'];
[b, bint, r, rint, s] = regress(Y, X)

