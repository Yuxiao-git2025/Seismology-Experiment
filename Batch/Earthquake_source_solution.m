clear;
close all;
clc;
% 加载震源机制解数据（假设文件为三列数据：走向、倾角和滑动角）
data = load('test.txt');
% 设置ETOA参数
max_iter = 2000; 
% 最大迭代次数
pop_size = 200; 
% 种群大小
global_best_solution = []; 
% 用于存储全局最佳解
% 初始化种群 (ETO全局搜索)
population = initialize_population(pop_size);
for iter = 1:max_iter 
    for i = 1:pop_size 
        % 计算每个个体的适应度 
        fitness = compute_misfit(population(i, :), data); 
        if isempty(global_best_solution) 
            global_best_solution.position = population(i, :); 
            global_best_solution.fitness = fitness; 
        elseif isfield(global_best_solution, 'fitness') && fitness < global_best_solution.fitness 
            global_best_solution.position = population(i, :); 
            global_best_solution.fitness = fitness; 
        end 
%         ETO更新 
population(i, :) = eto_update(population(i, :), global_best_solution.position, iter, max_iter); 
    end
end
% 提取ETOA得到的最优解，用于网格搜索初始值
initial_params = global_best_solution.position;
% 局部优化 (网格搜索)
grid_step = 5; 
% 网格步长
sigma1_range = linspace(initial_params(1) - grid_step, initial_params(1) + grid_step, 5);
sigma2_range = linspace(initial_params(2) - grid_step, initial_params(2) + grid_step, 5);
sigma3_range = linspace(initial_params(3) - grid_step, initial_params(3) + grid_step, 5);min_misfit = inf;
best_params = [];
for sigma1_dir = sigma1_range 
    for sigma2_dir = sigma2_range 
        for sigma3_dir = sigma3_range 
            params = [sigma1_dir, sigma2_dir, sigma3_dir]; 
            % 计算应力张量并计算适应度 
            misfit = compute_misfit(params, data); 
            % 更新最优解 
            if misfit < min_misfit 
                min_misfit = misfit; 
                best_params = params; 
            end 
        end 
    end
end
% 计算最佳参数对应的应力张量，并提取主应力轴的方位角和倾伏角
[stress_tensor, principal_stress_angles] = compute_stress_tensor(best_params);
% ========================% 辅助函数实现% ========================
function population = initialize_population(pop_size) 
    % 随机初始化种群 
    population = rand(pop_size, 3) * 360; 
    % 假设每个方向在0到360度之间
    end
    function misfit = compute_misfit(params, data) 
    % 根据震源机制解和应力参数，计算应力张量并返回RMS误差 
    stress_tensor = compute_stress_tensor(params); 
    misfit_sum = 0; 
    for i = 1:size(data, 1) 
        strike = data(i, 1); 
        dip = data(i, 2); 
        rake = data(i, 3); 
        % 计算理论应力张量的震源机制解 
        predicted_mechanism = stress_to_mechanism(stress_tensor); 
        % 计算误差（使用均方根误差） 
        misfit_sum = misfit_sum + (predicted_mechanism - [strike, dip, rake]) .^ 2; 
    end 
    misfit = sqrt(misfit_sum / size(data, 1)); 
    % 均方根误差endfunction 
    [stress_tensor, principal_stress_angles] = compute_stress_tensor(params); 
    % 构建应力张量并计算主应力轴的方位角与倾伏角 
    stress_tensor = diag([params(1), params(2), params(3)]); 
    % 示例张量 
    % 特征分解获取主应力轴 
    [eig_vectors, eig_values] = eig(stress_tensor); 
    % 计算方位角和倾角 
    principal_stress_angles = zeros(3, 2); 
    for i = 1:3 
        vector = eig_vectors(:, i); 
        azimuth = atan2d(vector(2), vector(1)); 
        dip = asind(-vector(3)); 
        principal_stress_angles(i, :) = [azimuth, dip]; 
    end
    end
function updated_position = eto_update(position, global_best, iter, max_iter) 
    % ETO更新规则 
    A = 0.7; 
    % 控制因子 
    B = 0.8; 
    % 控制因子 
    new_position = position .* exp(-A * iter / max_iter) + B * sin(2 * pi * global_best); 
    updated_position = new_position;
    end
function predicted_mechanism = stress_to_mechanism(stress_tensor) 
    % 将应力张量转化为理论震源机制解（简化示例） 
    % 实际上应根据应力张量与震源机制解之间的数学关系来计算 
    % 假设输出为一组 [strike, dip, rake] 值的近似计算 
    % 此处仅为示例代码，应根据实际模型实现 
    predicted_mechanism = [0, 0, 0] + randn(1,3) * 0.1; % 随机扰动
end