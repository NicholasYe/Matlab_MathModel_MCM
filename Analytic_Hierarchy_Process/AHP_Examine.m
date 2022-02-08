% A: 判断矩阵
% Lmax: A的最大特征值
% CI: 一致性指标
% CR: 一致性指标比率
% W: 权重向量

clc, clear all, close all;
B1 = [1, 2, 5; 1/2, 1, 2; 1/5, 1/2, 1];
[L1, CI1, CR1, W1] = AHP(B1);

%% 合理性判断函数
function [Lmax, CI, CR, W] = AHP(A)

% 矩阵A方阵判断
[m, n] = size(A); 
if m ~= n
    warning('判断矩阵应为方阵')
    return
end

% 矩阵A正反负矩阵判断
id = tril(true(m), -1);
aij = A(id);
B = A';
bij = B(id);
if any(aij.*bij ~= 1)
    warning('判断矩阵应为正负反矩阵')
    return
end

% 内置随机一致性指标(矩阵阶数小于17)
RI_Vec = [0, 0, 0.51, 0.89, 1.12, 1.26, 1.36, 1.41, 1.46, 1.49, 1.52, 1.54, 1.56, 1.58, 1.59, 1.6];
RI = RI_Vec(m);

% 检验
[V, L] = eig(A, 'vector');
L = real(L);
[Lmax, id] = max(L);
CI = (Lmax - m)/(m - 1);
CR = CI/RI;
W = V(:, id);
W = W/sum(W);
if CR < 0.1
    disp('通过一致性检验')
else
    disp('未通过一致性检验')
end

end

