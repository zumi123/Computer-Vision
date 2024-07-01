function sorted_array = merge_sort(arr)
    if length(arr) <= 1
        sorted_array = arr;
        return;
    end
    mid = floor(length(arr) / 2);
    left = merge_sort(arr(1:mid));
    right = merge_sort(arr(mid+1:end));
    sorted_array = merge(left, right);
end

function result = merge(left, right)
    result = [];
    while ~isempty(left) && ~isempty(right)
        if left(1) <= right(1)
            result = [result, left(1)];
            left(1) = [];
        else
            result = [result, right(1)];
            right(1) = [];
        end
    end
    result = [result, left, right];
end
