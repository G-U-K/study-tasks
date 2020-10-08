function remembered = IPST_lab5_p3(x_start)
% Строит бифуркационную диаграмм для
% заданного нелинейного дискретного отображения.
% cos(2*pi*x_prev)*(-lambda/2.0/pi)+(sqrt(5)-1)/2
% cos(2*pi.*x).*(-a./2./pi)+(sqrt(5)-1)/2
% Рабочий диапазон лямбды 0..0.39

% проверим что лямбда - скаляр
if ~isscalar(x_start)
    disp('x_start должен быть скаляром.');
    return
end

% задаем отсчеты по оси горизонтальной
lambda = linspace(0, 2.25, 800);

% вычислим заранее множитель и аддитивную часть отображения
multX = -lambda/2.0/pi;
addX = (sqrt(5)-1)/2;

% пропускаем первые 200 итераций
x_next = x_start; % дали начальное значение на 0-итерации
for iter=1:200
    x_next = multX.*cos(2*pi*x_next)+addX;
end

% запоминаем buffsize следующих итераций
buffsize = 800; % отсчетов по вертикальной оси
remembered = zeros(buffsize,length(lambda));
for iter=1:buffsize 
    x_next = multX.*cos(2*pi*x_next)+addX;
    remembered(iter,:) = x_next;
end

% развернем матрицу в вектор с собоюдением пар координат
x = reshape(repmat(lambda, buffsize,1),1,[]);
y = reshape(remembered,1,[]);

% построение
scatter(x,y,1)
xlabel('a')
ylabel('f(x)')
ylim([0,1])
title('Бифуркационная диграмма функции f(x)= cos(2*pi.*x).*(-a./2./pi)+(sqrt(5)-1)/2')
end