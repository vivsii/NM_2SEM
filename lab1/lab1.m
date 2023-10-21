%вариант 6
f1 = @(x) atan(3 .* x) ./ (9 .* x .* x +1);
f2 = @(x) 1 ./ log( x + 1);

%объявление переменных
a = 0.1; % начало отрезка
b = 1; % конец отрезка
%шаги интегрирования
n1 = 10; 
n2 = 100; 

tol = @(x1, x2) (x2 - x1) / x1;

S1 = [n1, 0, n2, 0];
S1(5,1) = integral(f1,a,b);

S1(2,1) = trapezoid(a,b,n1,f1);
S1(2,2) = tol(S1(2,1), S1(5,1));
S1(2,3) = trapezoid(a,b,n2,f1);
S1(2,4) = tol(S1(2,3), S1(5,1));

S1(3,1) = rectangle(a,b,n1,f1);
S1(3,2) = tol(S1(3,1), S1(5,1));
S1(3,3) = rectangle(a,b,n2,f1);
S1(3,4) = tol(S1(3,3), S1(5,1));

S1(4,1) = simpson(a,b,n1,f1);
S1(4,2) = abs(tol(S1(4,1), S1(5,1)));
S1(4,3) = simpson(a,b,n2,f1);
S1(4,4) = abs(tol(S1(4,3), S1(5,1)));

S2 = [n1, 0, n2, 0];
S2(5,1) = integral(f2,a,b);

S2(2,1) = trapezoid(a,b,n1,f2);
S2(2,2) = tol(S2(2,1), S2(5,1));
S2(2,3) = trapezoid(a,b,n2,f2);
S2(2,4) = tol(S2(2,3), S2(5,1));

S2(3,1) = rectangle(a,b,n1,f2);
S2(3,2) = tol(S2(3,1), S2(5,1));
S2(3,3) = rectangle(a,b,n2,f2);
S2(3,4) = tol(S2(3,3), S2(5,1));

S2(4,1) = simpson(a,b,n1,f2);
S2(4,2) = abs(tol(S2(4,1), S2(5,1)));
S2(4,3) = simpson(a,b,n2,f2);
S2(4,4) = abs(tol(S2(4,3), S2(5,1)));

function s = trapezoid(a, b, n, f)
    s = 0;
    h = (b - a) / n;
    x = a;

    while(n > 1)
         s = s + (f(x) + f( x + h)) / 2 * h;
         x = x + h;
         n = n - 1;
    end
end

function s = rectangle(a, b, n, f)
    s = 0;
    h = (b - a) / n;
    x = a + h / 2;


    while(n > 1)
        s = s + f(x) * h;
        x = x + h;
        n = n - 1;
    end
end

function s = simpson(a, b, n, f)
    s = 0;
    h = (b - a) / n;
    x = a;

    while(n > 1)
        s = s + (f(x) + 4 * f(x + h) + f(x + 2*h)) * h / 3;
        x = x + 2 * h;
        n = n - 2;
    end
end