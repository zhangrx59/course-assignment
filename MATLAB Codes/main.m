% 定义参数集
param_sets = [20 0.6 0.2 10 15;
20 0.6 0.2 10 15;
20 0.6 0.1 10 15;
20 0.1 0.6 10 15;
20 0.6 0.1 10 15;
5 0.6 0.1 5 7];   

% 初始化变量以存储所有曲线
all_curves = zeros(size(param_sets, 1), max(param_sets(:,1)));

% 对每组参数执行进化算法
for i = 1:size(param_sets, 1)
    [Gen, pc, pm, P0, P] = deal(param_sets(i,1), param_sets(i,2), param_sets(i,3), param_sets(i,4), param_sets(i,5));
    best_curve = zeros(1, Gen);
    % 初始化种群，确保 x 在 [1, 4] 范围内
    pop = 1 + 100* rand(P0, 1);
    disp(pop)
    pop_bin = arrayfun(@(x) encode(x), pop, 'UniformOutput', false);

    for gen = 1:Gen
        % 计算适应度
        pop = cellfun(@(x) decode(x), pop_bin);
        fitness = (pop - 2).^2;
        [best_fitness, best_idx] = min(fitness);
        best_curve(gen) = best_fitness;

        % 交叉操作
        for j = 1:round(pc * P0)
            parents = randperm(length(pop_bin), 2);
            min_length = min(length(pop_bin{parents(1)}), length(pop_bin{parents(2)}));
            crossover_point = randi([1, min_length - 1]);
            [child1, child2] = crossover(pop_bin{parents(1)}, pop_bin{parents(2)}, crossover_point);
            pop_bin{end+1} = child1;
            pop_bin{end+1} = child2;
        end

        % 变异操作
        for j = 1:round(pm * length(pop_bin))
            mutant_idx = randi(length(pop_bin));
            mutation_point = randi([1, length(pop_bin{mutant_idx})]);
            pop_bin{mutant_idx} = mutation(pop_bin{mutant_idx}, mutation_point);
        end
        % 限制种群大小
        if length(pop_bin) > P
            pop_bin = pop_bin(randperm(length(pop_bin), P));
        end
    end
    all_curves(i, 1:Gen) = best_curve;
end
% 绘制所有曲线
figure;
hold on;
colors = ['b', 'g', 'r', 'c', 'm', 'y']; % 不同的颜色代表不同的参数集
for i = 1:size(param_sets, 1)
    plot(all_curves(i,:), colors(i),LineWidth=2);
end
title('Best fitness over generations for different parameter sets');
xlabel('Generation');
ylabel('Best fitness');
legend('20 0.6 0.2 100 150','20 0.6 0.2 10 15','20 0.6 0.1 100 150','20 0.1 0.6 10 15','20 0.6 0.1 100 150','5 0.6 0.1 100 150');     
grid on;
hold off;
% 辅助函数（mutation, crossover, coded,decoded）定义在这里
%变异
function mutant = mutation(individual, mutation_point)
    % 此函数在指定位置变异染色体信息
    mutant = individual;
    if mutant(mutation_point) == '1'
        mutant(mutation_point) = '0';
    else
        mutant(mutation_point) = '1';
    end
end
%交叉
function [child1, child2] = crossover(parent1, parent2, crossover_point)
    % 此函数在指定位置交换父代染色体的部分信息
    % 产生子代染色体
    child1 = [parent1(1:crossover_point), parent2(crossover_point+1:end)];
    child2 = [parent2(1:crossover_point), parent1(crossover_point+1:end)];
end
%编码
function coded = encode(x)
    % 此函数将数值x编码为特定格式的二进制字符串
    int_part = floor(x); % 整数位
    dec_part = x - int_part; % 小数部分
    ten_part = floor(dec_part * 10); % 十分位
    hundred_part = round(mod(dec_part * 100, 10)); % 百分位
    % 转换为二进制字符串
    int_str = dec2bin(int_part, 1);
    ten_str = dec2bin(ten_part, 4);
    hundred_str = dec2bin(hundred_part, 4);
    coded = [int_str, ten_str, hundred_str];
end
%解码
function decoded = decode(binStr)
    % 此函数将二进制字符串转换为实数
    % 假设编码格式为1位整数部分，4位十分位，4位百分位
    int_part = bin2dec(binStr(1));
    ten_part = bin2dec(binStr(2:5)) / 10;
    hundred_part = bin2dec(binStr(6:9)) / 100;
    decoded = int_part + ten_part + hundred_part;
end