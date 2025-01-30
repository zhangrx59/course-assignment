x = 1.51;  
y = 1.5221;  
fprintf('原数字是： %f\n', x);  
binary_code_x = float_to_binary(x);  % 将十进制小数转化为二进制编码  
disp(binary_code_x);
fprintf('原数字是： %f\n', y);  
binary_code_y = float_to_binary(y);  % 将十进制小数转化为二进制编码
disp(binary_code_y);

function binary_code = float_to_binary(x)  
    % 获取整数部分  
    integer_part = floor(x);
    % 获取小数部分  
    decimal_part = x - integer_part;
    % 构建整数部分的二进制编码  
    binary_code_integer = dec2bin(integer_part);
    % 构建小数部分的二进制编码
    binary_code_decimal = '';
    while decimal_part > 0
        decimal_part = decimal_part * 2;
        if decimal_part >= 1
            binary_code_decimal = [binary_code_decimal '1'];
            decimal_part = decimal_part - 1;
        else
            binary_code_decimal = [binary_code_decimal '0'];
        end
    end
    binary_code = [binary_code_integer '.' binary_code_decimal];
end