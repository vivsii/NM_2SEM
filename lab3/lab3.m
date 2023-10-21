F = @(x) x.^3 + 2.*x.^2 + x - 1;

a = 0;
b = 3;
e = 0.01;
[p1, p2] = p();
x1=half(F,a,b,e);
x2=newton(F,a,b,e,p1,p2);

function k = half(F,a,b,eps)
    while abs(b-a) > eps 
        k = (a+b)/2;
        if F(a)*F(k) < 0 
            b = k;
        elseif F(b)*F(k) < 0
            a = k;
        end     
    end
    k = (a+b)/2;
end

function k = newton(F,a,b,eps, der1,der2) 

    if F(a)*der2(a) > 0 
            k = a;
    elseif F(b)*der2(b) > 0
            k = b;
    end     
    pr = F(k)/der1(k); 
    while abs(pr) > eps
        pr = F(k)/der1(k);
        k = k- pr;
    end
end

%функция производной
function [p1,p2] = p()
    syms x;  
    f = x.^3+12.*x-12;
    p1 = matlabFunction(diff(f));
    p2 = matlabFunction(diff(f, 2));
    
end