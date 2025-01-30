% 对1.51的编码结果进行验证
coded_value = encode(1.51);
disp(['Encoded 1.51: ', coded_value]);
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
