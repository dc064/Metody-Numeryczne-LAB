clc
clear
close all
format compact

A = [4, 5, 6, 2, 3; 
    1, 2, 3, 4, 5; 
    7, 2, 6, 1, 2; 
    2, 3, 5, 6, 7; 
    3, 4, 6, 3, 2];

B = [3;
    4;
    5;
    6;
    7];

Bstart = B;
Astart = A;

Adims = size(A);
%Adims(1)- columns; Adims(2)- rows

detA = det(A);
if (detA == 0)
    fprintf('Cannot resolve: wrong matrix A (det(A) = 0)\n')
    return
end

x = zeros(Adims(1), 1);

for row = 1 : Adims(1)-1

    for column = Adims(1) : -1 : row+1
        
        %wybor wspolczynnika
        currentConf = A(column, row) / A(row, row);

        %mnozenie wiersza przez ten wspolczynnik
        for k = 1:Adims(2)

            A(column,k) = A(column, k) - currentConf * A(row,k);

        end

        B(column) = B(column) - currentConf * B(row);

    end

end

%ostatni element x
x(Adims(1)) = B(Adims(1)) / A(Adims(1), Adims(2));

%iteracja po x od dolu...
for column = Adims(1)-1 : -1 : 1  

    currentSum = 0;
    for row = Adims(1) : -1 : column+1                
        currentSum = currentSum + A(column,row) * x(row);    
    end 
    x(column) = (B(column) - currentSum) / A(column,column);

end

A
x
B
