function [spent_time, solution] = Modl_lab5_var2_p1(fill_random, t_ij)
% 1. –азработать компьютерную программу решени€ задачи
% ƒжонсона дл€ двух станков методом полного перебора.
% 
% ¬ходные параметры:
% fill_random : logical - заполнить ли значени€ матрицы случайными числами.
% t_ij - матрица времен обработки i-й детали на j-м станке
% или если fill_random == true, то размер такой матрицы.
% 
% ¬ыходные параметры:
% solution - найденное решение задачи ƒжонсона в виде вектора 
% последовательности деталей.
% spent_time - времени решени€ задачи методом полного перебора в секундах. 
% 
% ѕример вызова: 
% Modl_lab5_var2_p1(false, [2 5 9 ; 1 4 1 ; 9 1 61 ; 0 12 3])
% Modl_lab5_var2_p1(true, [5,9])

% проверим что тип аргумента logical
if ~islogical(fill_random)
    disp('ѕервый аргумент должен иметь логический тип!')
    spent_time=nan;
    return
end

% заполним матрицу случайными числами
if fill_random
    t_ij = rand(t_ij);
end
[m,n] = size(t_ij); % m деталей ,n станков

% моменты времени когда предыдуща€ деталь покидает j-й станок
ends = zeros(1,n);
% текущее лучшее врем€ дл€ комбинации solution
best_result = inf;

% параметры дл€ проверки всех комбинаций
items = 1:m;
nitems = length(items);
total_combinations = prod(items);

% включаем таймер
tic;

% проходи
for iter=0:total_combinations-1
%     формируем текущую комбинацию
    comb=Modl_lab5_var2_p1_combination(iter,items,nitems,total_combinations);
    % -----расчет-длительности-обработки-группы-------
    ends(1) = t_ij(comb(1),1);
    for j = 2:n
        ends(j)= ends(j-1)+t_ij(comb(1),j);
    end
    for i = 2:m
        ends(1)=ends(1)+t_ij(comb(i),1);
        for j = 2:n
    %         обработка на текущем станке текущей детали
    %         закончитс€ через заданное врем€ после момента,
    %         когда освободились и станок и деталь /мах()/
            ends(j)= t_ij(comb(i),j)+max(ends(j),ends(j-1));
        end 
    end
    % ------------------------------------------------
    % ---------выбор-бысрейшей-комбинации-------------
    if ends(end)<best_result
        best_result = ends(end);
        solution = comb;
    end
    % ------------------------------------------------
end

spent_time = toc;
end