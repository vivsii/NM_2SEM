A = [2 1 1 1; 2 2 1 1; 2 2 2 1; 2 2 2 3]
B = [2; 3; 3; 1];


det(A); %проверка, чтобы определитель не был равен 0

x = inv(A)*B; % метод обратной матрицы


i=1;
X = [A B];
[nX, mX] = size(X);
while i<= nX
    if X(i,i)==0 
        disp('Диагональный элемент равен 0')
        return 
    end
    X = func(X,i,i);
    i = i +1;
end
C = X(:,mX); 
 
function X = func(X,i,j)
    [ nX, ~ ] = size( X)
    a = X(i,j);
    X(i,:) = X(i,:)/a; 
    for k =  1:nX
        if k == i
            continue
        end
        X(k,:) = X(k,:) - X(i,:)*X(k,j);
    end
end