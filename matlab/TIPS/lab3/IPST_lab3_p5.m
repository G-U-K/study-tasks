function res = IPST_lab3_p5(kind,a,b,xmin,xmax)
% Вычисляет интеграл заданных функций. 
%  Входные параметры : функция (kind
% ==1 - «экспоненциальная» y=exp(a+b*x), 
% ==2 - «логарифмическая» y=log(a+b*x), 
% ==3 - «степенная» y=(b+x)^a),
% пределы интегрирования; 
% выходные – значение интеграла.
close all
x=xmin:0.01:xmax;
if kind==1
    y=exp(a+b.*x);
    res=integral(@(x) exp(a+b.*x),xmin,xmax);
elseif kind==2
    y=log(a+b.*x);
    res=integral(@(x) log(a+b.*x),xmin,xmax);
elseif kind==3
    y=(b+x).^a;
    res=abs(integral(@(x)(b+x).^a,xmin,b))... 
       +integral(@(x)(b+x).^a,b,xmax);
else
    disp('Некорректное значение ид вида функции')
    res=nan;
end
plot(y)
area(x,y ,'FaceColor', 'y');
hold on
grid on
xlabel('x');
ylabel('y');
title('Площадь фигуры вычисленного интеграла функции')
end