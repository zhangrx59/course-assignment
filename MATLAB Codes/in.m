% 读取Excel文件的数据  
data = xlsread("C:\Users\张芮熙\Desktop\1.et", 'Sheet1', 'A1:E5'); % 假设数据在A1到E5范围内  
  
% 计算标准差  
std_dev = std(data(:,1:5)); % 假设数据在第二到第五列（即B到E列）  
  
% 将标准差写入F列  
result = [data(:,1), std_dev];  
xlswrite("C:\Users\张芮熙\Desktop\1.et", result, 'Sheet1', 'F1:F5'); % 假设结果写入F1到F5范围内