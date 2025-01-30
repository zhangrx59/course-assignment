% 示例：
individual = '101010001';
mutation_point = length(individual); % 在最后一位进行变异
mutant = mutation(individual, mutation_point);
disp(['Mutated individual: ', mutant]);
function mutant = mutation(individual, mutation_point)
    % 此函数在指定位置变异染色体信息
    mutant = individual;
    if mutant(mutation_point) == '1'
        mutant(mutation_point) = '0';
    else
        mutant(mutation_point) = '1';
    end
end

