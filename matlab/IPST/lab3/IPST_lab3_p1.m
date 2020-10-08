function [diff_val, y_diff] = IPST_lab3_p1(kind,a,b,point)
% Вычисляет значение производной в заданной точке.
% Входные параметры : функция (kind
% ==1 - «экспоненциальная» y=exp(a+b*x), 
% ==2 - «логарифмическая» y=log(a+b*x), 
% ==3 - «степенная» y=(b+x)^a),
% point - координата точки; 
% выходные – значение производной(скаляр).
close all;
syms x;
if kind==1
    y=exp(a+b*x);
elseif kind==2
    y=log(a+b*x);
elseif kind==3
    y=(b+x).^a;
else
    diff_val=nan;
    disp('Неизвестный тип функции!');
    return
end

y_diff=diff(y);
y_func=matlabFunction(y_diff);
diff_val=y_func(point);

func = ezplot(y);
set(func, 'LineWidth', 2)
hold on
d_func= ezplot(y_diff);
set(d_func, 'LineWidth', 2)
grid on;
xlabel('x');
ylabel('y');
title('График исходной функции и ее производной ')
legend('Исходная функция', 'Производная функции')
% ylim([-4 5])
% xlim([-6 6])

end