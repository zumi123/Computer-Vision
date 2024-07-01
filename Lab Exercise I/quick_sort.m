function sorted_array = quick_sort(arr)
    if length(arr) <= 1
        sorted_array = arr;
        return;
    end
    pivot = arr(1);
    left = arr(arr < pivot);
    right = arr(arr > pivot);
    sorted_array = [quick_sort(left), pivot, quick_sort(right)];
end
