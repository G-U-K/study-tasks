function [ring] = make_choice(current_ring)
%
%Функция выбора направления движения
%Используем assert для исключения вариантов выходящих за предел лабиринта
    assert(current_ring >= 1 && current_ring < 5)
%Выбор направления в зависмости от позиции.Функция randi(n)имеет нормальное
%распределение,что подходит нам в случае равной вероятности возможного
%напрвления.randi(n)dозвращает диапазон от 0:n
    switch current_ring
        case 1
            ring = 2;
        case 2
            ring = randi(3);
        case 3
            if randi(2) == 1
                ring = 2;
            else
                ring = 4;
            end
        case 4
            if randi(2) == 1
                ring = 3;
            else
                ring = 5;
            end
    end
end