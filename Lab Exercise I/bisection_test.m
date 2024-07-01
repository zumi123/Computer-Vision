f = @(x) x^2 - 4;
a = 0;
b = 3;
tol = 1e-6;
root = bisection_method(f, a, b, tol)
disp(root);
