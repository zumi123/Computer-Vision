function sorted_array = bubble_sort(arr)
    n = length(arr);
    for i = 1:n
        for j = 1:n-i
            if arr(j) > arr(j+1)
                temp = arr(j);
                arr(j) = arr(j+1);
                arr(j+1) = temp;
            end
        end
    end
    sorted_array = arr;
end
