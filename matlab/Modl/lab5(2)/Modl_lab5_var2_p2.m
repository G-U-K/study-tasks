function [spent_time, solution] = Modl_lab5_var2_p2(fill_random, t_ij)
% 2. Разработать компьютерную программу решения задачи Джонсона
% для двух станков алгоритмом Джонсона.
% 
% Входные параметры:
% fill_random : logical - заполнить ли значения матрицы случайными числами.
% t_ij - матрица времен обработки i-й детали на j-м станке
% или если fill_random == true, то размер такой матрицы.
% 
% Выходные параметры:
% solution - найденное решение задачи Джонсона в виде вектора 
% последовательности деталей.
% spent_time - времени решения задачи алгоритмом Джонсона в секундах. 
% 
% Пример вызова: 
% Modl_lab5_var2_p2(false, [2 5 ; 4 1 ; 9 1 ; 0 3])
% Modl_lab5_var2_p2(true, 5)

% проверим что тип аргумента logical
if ~islogical(fill_random)
    disp('Первый аргумент должен иметь логический тип!')
    spent_time=nan;
    return
end

% заполним матрицу случайными числами
if fill_random
    t_ij = rand(t_ij,2);
end
[m,n] = size(t_ij); % m деталей ,n станков

if n~=2
    disp('Размерность t_ij должна быть m x 2 !')
    spent_time=nan;
    return
end

solution = zeros(1,m);
items_not_distributed = 1:m;
rbound=m;lbound=1;

% включаем таймер
tic;

while ~isscalar(items_not_distributed)
    [v,row] = min(t_ij(items_not_distributed,:));
    [~,col] = min(v);
    item = items_not_distributed(row(col));
    items_not_distributed =items_not_distributed(items_not_distributed~=item);
    if col==1
        solution(lbound)=item;
        lbound = lbound+1;
    else
        solution(rbound)=item;
        rbound = rbound-1;
    end
end
solution(lbound)=items_not_distributed;

spent_time = toc;
end