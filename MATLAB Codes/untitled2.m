
    str = input('请输入一个字符串: ', 's'); % 接受用户输入字符串
    nums = regexp(str, '\d+', 'match'); % 使用正则表达式提取字符串中的数字
    disp(nums);
    % 将提取的数字字符串转换为整数
    numArray = cellfun(@str2num, nums);
    % 计算数字的平均值
    average = mean(numArray);
    fprintf('提取的数字平均值为: %.2f\n', average); % 显示数字的平均值