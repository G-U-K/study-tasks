function res = IPST_lab3_p4(coeffs,varargin)
% Находит экстремумы полинома 3-го порядка.
% Входные параметры – коэффициенты полинома,
% опционально границы аргумента для построения графика;
% выходные – координаты экстремумов.

% проверяем на правильность входные аргументы

if nargin<2
    narginchk(1,1);
    xmin=-5.;
    xmax=5.;
else
    narginchk(3,3);
    xmin=varargin{1};
    xmax=varargin{2};
end

% проверяем вектор коэффициентов
if any(size(coeffs)~=[1,4])
    disp('Вектор коэффициентов должен быть формы (1,4)');
    res=nan;
    return
end
% определяем полином как символьную функцию
syms y(x);
y(x)=sum(coeffs.*[x.^3,x.^2,x,1]);

% ищем экстремумы
y_diff=diff(y);

res=transpose(double(solve(y_diff(x),x)));
xmin=min(xmin, res(1));
xmax=max(xmax, res(2));

% строим график полинома
figure
samples=linspace(xmin,xmax);
samples_y=double(y(samples));
plot(samples,samples_y),grid

title('График полинома 3-го порядка')
xlabel('x,\rightarrow')
ylabel('y,\rightarrow')

ymin=min(samples_y);
ymax=max(samples_y);
axis([xmin, xmax, ymin, ymax])

% выделяем точки экстремума на графике, если они есть
if all(isreal(res))
    hold on
    grid on
    % выделяем границы как локальные экстремумы
    borders=minmax([res, samples(1), samples(length(samples))]);
    
    % подписываем экстремумы
    not_borders=setdiff(res, borders);
    not_borders_y=double(y(not_borders));
    scatter(not_borders,not_borders_y,'rx')   
    for i=1:length(not_borders)
        x_ = not_borders(i);
        y_ = not_borders_y(i);
        text(x_-1.2, y_-20, sprintf('(%.2f;%.2f)', x_, y_))
    end
    
    % подписываем границы
    borders_y=double(y(borders));
    scatter(borders, borders_y, 'rx')
    delta_x = [+0.2, -2.25];
    delta_y = [+20, -10];
    for i=1:length(borders)
        x_ = borders(i);
        y_ = borders_y(i);
        text(x_ + delta_x(i), y_ + delta_y(i), sprintf('(%.2f;%.2f)', x_, y_))
    end
    legend('Функция полинома','Точки экстремума')
else
    disp('Нет экстремумов')
end
end