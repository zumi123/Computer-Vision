function is_palindrome = check_palindrome(str)
    is_palindrome = strcmp(str, fliplr(str));
end
