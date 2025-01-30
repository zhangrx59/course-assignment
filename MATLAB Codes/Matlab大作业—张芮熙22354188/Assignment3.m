% 定义目标函数
f = @(x) 2*x(1)^2 + 4*x(2)^2 - 6*x(1) - 2*x(1)*x(2);
% 定义目标函数的梯度
gradf = @(x) [4*x(1)-6-2*x(2); 8*x(2)-2*x(1)];
% 设置初始点
x0 = [100; 100];
% 设置迭代步长
alpha = 0.01;
% 设置迭代次数
max_iter = 1e-6;
% 迭代求解
x = x0;
count=0;
d=1;
while abs(d)>max_iter
    % 计算梯度
    g = gradf(x);
    % 最速下降方向
    d = -g;
    % 更新x
    x = x + alpha*d;
    count=count+1;
    % 输出迭代信息
    disp(['Iter ', num2str(count), ': x = [', num2str(x(1)), ', ', num2str(x(2)), '], f(x) = ', num2str(f(x))]);
end