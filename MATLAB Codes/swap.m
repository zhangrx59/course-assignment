% 示例：
parent1 = '101010001';
parent2 = '100000001';
crossover_point = 4; % '|'的位置
[child1, child2] = crossover(parent1, parent2, crossover_point);
disp(['Child 1: ', child1]);
disp(['Child 2: ', child2]);
function [child1, child2] = crossover(parent1, parent2, crossover_point)
    % 此函数在指定位置交换父代染色体的部分信息
    % 产生子代染色体
    child1 = [parent1(1:crossover_point), parent2(crossover_point+1:end)];
    child2 = [parent2(1:crossover_point), parent1(crossover_point+1:end)];
end

