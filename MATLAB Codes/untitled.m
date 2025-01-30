 inline count = findValidSequences(n, leftCount, rightCount)
    if leftCount < rightCount
        count = 0; % 不合法的情况，返回 0
        return;
    end
    
    if leftCount == n && rightCount == n
        count = 1; % 找到一个合法的序列
        return;
    end
    
    count = 0;
    
    % 尝试放置左括号
    if leftCount < n
        count = count + findValidSequences(n, leftCount + 1, rightCount);
    end
    
    % 尝试放置右括号
    if rightCount < n
        count = count + findValidSequences(n, leftCount, rightCount + 1);
    end


% 调用函数
n = 3; % 根据题目要求，2n 为序列的长度
count = findValidSequences(n, 0, 0);
disp(count);