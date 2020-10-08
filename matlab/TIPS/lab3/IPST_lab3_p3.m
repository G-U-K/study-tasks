function diff_expr = IPST_lab3_p3(a,b,c,varargin)
% Вычисляет производную полинома второй степени и 
% выводит график исходной функции и производной. 
% Входные параметры – коэффициенты полинома ax^2+bx+c.
% Можно указать границы аргумента для построения графика

% проверяем на правильность количества входных аргументов
if nargin<4
    narginchk(3,3);
    xmin=-10.;
    xmax=10.;
else
    narginchk(5,5);
    xmin=varargin{1};
    xmax=varargin{2};
end

% символьные выражения
syms x;
y_expr = a.*x.^2+b.*x+c;
diff_expr=diff(y_expr);

% конвертация в вычисляемые функции
y_func = matlabFunction(y_expr);
diff_func = matlabFunction(diff_expr);

% построение графика
samples=linspace(xmin,xmax,50);
plot(samples,y_func(samples),samples,diff_func(samples));
legend('Исходная функция','Производная'),grid
title('График исходной и производной функции')
xlabel('x,\rightarrow')
ylabel('y,\rightarrow')

end