x = 1.51;
y = 1.5221;
fprintf('原数字是： %f\n', x);
binary_code_x = float_to_binary(x);  % 将十进制小数转化为二进制编码
fprintf('原数字是： %f\n', y);
binary_code_y = float_to_binary(y);  % 将十进制小数转化为二进制编码
function binary_code = float_to_binary(x)
    % 获取整数部分
    integer_part = floor(x);
    % 获取小数部分
    decimal_part = x - integer_part;
    % 构建整数部分的二进制编码
    binary_code = dec2bin(integer_part);
    
    % 添加小数点
    binary_code = [binary_code '.'];
    
    % 对小数部分进行二进制转换
    precision = 10; % 设置小数部分的最大精度
    while decimal_part > 0 && precision > 0
        decimal_part = decimal_part * 2;
        if decimal_part >= 1
            binary_code = [binary_code '1'];
            decimal_part = decimal_part - 1;
        else
            binary_code = [binary_code '0'];
        end
        precision = precision - 1;
    end
    
    fprintf('二进制编码是: %s\n', binary_code);
end


