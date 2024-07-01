function result = matrix_multiply(A, B)
    [r1, c1] = size(A);
    [r2, c2] = size(B);
    if c1 != r2
        error("Matrices cannot be multiplied");
    end
    result = zeros(r1, c2);
    for i = 1:r1
        for j = 1:c2
            for k = 1:c1
                result(i,j) += A(i,k) * B(k,j);
            end
        end
    end
end
% Matrix Multiplication Test
A = [1, 2; 3, 4];
B = [5, 6; 7, 8];
result = matrix_multiply(A, B);
disp('Matrix Multiplication Result:');
disp(result);