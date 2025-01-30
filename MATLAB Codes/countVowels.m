
    str = input('请输入一个字符串: ', 's'); % 接受用户输入字符串
    str = lower(str); % 将字符串转换为小写字母，以便统计
    vowels = 'aeiou'; % 元音字母
    vowelCount = 0; % 元音字母计数器
    
    for i = 1:length(str)
        if contains(vowels, str(i))
            vowelCount = vowelCount + 1;
        end
    end
    
    fprintf('元音字母出现次数为：%d\n', vowelCount); % 显示元音字母出现次数


% 调用函数
