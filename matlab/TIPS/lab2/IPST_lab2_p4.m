function res = IPST_lab2_p4()
% —оздает трЄхмерную матрицу,
% заполненную случайными целыми числами (от 0 до 10) и производит
% арифметические поэлементные действи€ между двумерными массивами этой
% матрицы (по любой координате внутри матрицы). 
% «начени€ операции зависит от идентификатора:
% Ц id = С+Т
% Ц id = СЦТ
% Ц id = С*Т (поэлементное умножение).
% –азмерность матрицы по трЄм координатам и идентификатор запрашиваетс€ у 
% пользовател€ в процессе работы функции. ¬ыходной параметр Ц полученна€ матрица.

matrix_size = input('–азмерность матрицы по трЄм координатам (ввести вектор):\n');
if ~all(size(matrix_size )==[1,3])
    disp('Ќекорректна€ размерность матрицы');
    res = -1;
    return
end

matrix = rand(matrix_size)*10.
id = input('»дентификатор операции (ввести + / - / *):\n','s');

dim = 1; % производим операцию вдоль строк (суммируем столбцы)
% dim = 2; % производим операцию вдоль столбцов (суммируем строки)
% dim = 3; % производим операцию вдоль этажей (суммирует матрицы поэлементно по каждому этажу)

if strcmp('+',id)
    res = sum(matrix,dim);
elseif strcmp('*',id)
    res = prod(matrix,dim);
elseif strcmp('-',id)
    res = diff(matrix, dim);
else
    res=nan;
end

if isnan(res)
    return;
end

res_size = size(res);
% res_size(dim) = 1;
display(res_size);

close all
xlabel('X');
ylabel('Y');
zlabel('Z');
title('»тогова€ трЄхмерна€ матрица')

axis_x = [0, res_size(1)];
axis_y = [0, res_size(2)];
axis_z = [0, res_size(3)];
axis([axis_x axis_y axis_z]);

hold on
grid on

delta = 0.5;
for xi = 1 : 1 : res_size(1)
    for yi = 1 : 1 : res_size(2)
        for zi = 1 : 1 : res_size(3)
            text(xi-delta,yi-delta,zi-delta, num2str(res(xi,yi, zi)));
        end
    end
end
end