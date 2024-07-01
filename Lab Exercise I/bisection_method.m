% Bisection Method Function
function root = bisection_method(f, a, b, tol)
    if f(a) * f(b) >= 0
        error("f(a) and f(b) must have opposite signs");
    end
    while (b - a) / 2 > tol
        midpoint = (a + b) / 2;
        if f(midpoint) == 0
            root = midpoint;
            return;
        elseif f(a) * f(midpoint) < 0
            b = midpoint;
        else
            a = midpoint;
        end
    end
    root = (a + b) / 2;
end