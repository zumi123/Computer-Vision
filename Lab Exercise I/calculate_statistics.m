function [mean_val, median_val, mode_val] = calculate_statistics(data)
    mean_val = mean(data);
    median_val = median(data);
    mode_val = mode(data);
end
