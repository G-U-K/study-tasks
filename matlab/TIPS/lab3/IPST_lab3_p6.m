function res = IPST_lab3_p6(a,b,c,d,t_instance)
% Вычисляет скорость и ускорение физического тела в заданной точке.
% Тело движется по кривой описываемой полиномом третьей степени.
% Входные параметры – коэффициенты полинома at^3+bt^2+ct+d ,
% координата точки t_instance ;
% выходные - значение скорости и ускорения.
close all
% x=0:0.1:max(10, t_instance * 1.5);
% определяем полином как символьную функцию
syms y(x);
y(x)=sum([a b c d].*[x.^3,x.^2,x,1]);

% рисуем траекторию движения
subplot(311)
ezplot(y)
hold on
scatter(t_instance, double(y(t_instance)), 'rx'),  grid
hold off
title('График траектории движения')
legend('Траектория движения','Заданная точка')

% посчитаем скорость - производную координаты
y_diff=diff(y,x);
res.velocity = double(y_diff(t_instance));

% рисуем скорость движения
subplot(312)
ezplot(y_diff)
hold on
scatter(t_instance, double(y_diff(t_instance)), 'rx'), grid
hold off
title('График скорости движения')
legend('Скорость движения','Заданная точка')

% посчитаем ускорение - производную скорости
y_diff=diff(y_diff);
res.acceleration = double(y_diff(t_instance));

% рисуем ускорение
subplot(313)
ezplot(y_diff);
hold on
scatter(t_instance, double(y_diff(t_instance)), 'rx'), grid
hold off
title('График ускорения')
legend('Ускорение движения','Заданная точка')

end