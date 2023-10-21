%  x^3 + 0.4 * x + 2 = 0

syms f(x)
f(x) = x.^3 + 0.4* x + 2;
f1 = diff(f);

%f = @(x) x^3 + 0.4 * x + 2;
%f1 = @(x) 3.*x.^2 + 0.4;

eps = 0.01;

r(1) = half(f, 0, 1, eps);
r(2) = newton(f, f1, 0, 1, eps);
r(3) = iter(f, f1, 0, 1, eps);

function r = half(f, a, b, eps)
    r = 0;
    l = [a, b];
    while (abs(l(2)-l(1)) > eps)
       r = (l(1) + l(2)) / 2;
       if (f(l(1)) * f(r)) < 0
           l(2) = r;
       elseif (f(r) * f(l(2))) < 0
           l(1) = r;
       end
    end
end

function x = newton(f, f1, a, b, eps)
    x = 0;
    if (f(a) * f1(a)) > 0
        x = a;
    elseif (f(b) * f1(b)) > 0
        x = b;
    end
    while (abs(f(x)) > eps)
        if f1(x) > 0
            x = x - f(x)./f1(x);
        end
    end
end

function x = iter(f, f1, a, b, eps)
    x = b;
    x0 = a;
    M = 1.01 * f1(x);
    phi = @(x, M) x - f(x)/M;
    while (abs(x - x0) > eps)
        x0 = x;
        x = phi(x, M);
    end
end