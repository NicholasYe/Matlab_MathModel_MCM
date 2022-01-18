clc, clear, close all

%% 数据准备
X0 = xlsread('E:\WPS_Sync_Files\Matlab_Simulink\Math\Regression\logistic_regression_data.xlsx', 'C5:E24');
Y0 = xlsread('E:\WPS_Sync_Files\Matlab_Simulink\Math\Regression\logistic_regression_data.xlsx', 'F5:F24');
X1 = xlsread('E:\WPS_Sync_Files\Matlab_Simulink\Math\Regression\logistic_regression_data.xlsx', 'C5:E29');

%% 1ogistics 函数
GM = fitglm(X0, Y0, 'Distribution', 'binomial');
Y1 = predict(GM, X1);

%% 模型的评估
N0 = 1:size(Y0, 1); 
N1 = 1:size(Y1, 1);
plot(N0', Y0, '-kd');
hold on; 
scatter(N1', Y1, 'b')
xlabel('数据点编号');
ylabel('输出值');