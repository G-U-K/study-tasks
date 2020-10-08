% function x = IPST_lab4_p3_alt(lambda,x_start)
% lambda=0.39
%

% x_start=0;
% 
% % Строит паутинные диаграммы для
% % заданного нелинейного дискретного отображения.
% % cos(2*pi*x_prev)*)+(sqrt(5)-1)/2
% % Рабочий диапазон лямбды 0..0.39
% 
% % проверим что лямбда - скаляр
% if ~isscalar(lambda)
%     disp('Лямбда должен быть скаляром.)');
%     return
% end
% 
% % функция отображения
% multX = -lambda/2.0/pi;
% addX = (sqrt(5)-1)/2;
% x_next = @(x_prev) cos(2*pi*x_prev).*multX+addX;
% 
% % x_next = @(x_prev) lambda.*x_prev.*(1-x_prev);
% % для проверки на функции из примера
% 
% % точек для паутинной диаграммы
% dots=20;
% dots=dots*2;
% 
% % набор значений отображения
% x = zeros(1,dots+1);
% x(1)=x_start;
% for it= 2:2:dots
%      x(it)=x_next(x(it-1));
%      x(it+1)=x(it);
% end
% 
% % построение графиков
% figure
% % отсчеты по оси х
% samples=linspace(0,floor(x_start)+1,256);
% plot(samples,samples),legend('Прямая y=x'),hold on
% plot(samples,x_next(samples)),legend('Функция отображения'), grid,hold on
% 
% % анимированная ломанная паутинной диаграммы
% % h = animatedline;
% % vals_x=[x_start x(1:end-1)];
% % vals_y = [0 x(2:end)];
% % for k=1:14
% %     addpoints(h,vals_x(k),vals_y(k));
% %     pause(0.7)
% % %     grid on
% %     drawnow 
% % end
% legend('Прямая y=x','Функция отображения','NAME me')
% % xlabel,ylabel,title,axis,legend Постобработка графиков,TODO!!!
% end
a=0.39;
x0=0.05;
x=0:0.01:1;
y=cos(2*pi.*x).*(-a/2.0/pi)+(sqrt(5)-1)/2;
 %график исследуемой функции
y2=x;%график прямой
plot(x, y, 'b-')
hold on
grid on
plot(x, y2, 'g-')
y1=cos(2*pi*x)*(-a/2.0/pi)+(sqrt(5)-1)/2;
mycomet([x0 x0], [0 y1], 0.5, 0);
for k = 1:25
    mycomet([x0 y1], [y1 y1], 0.5, 0)
    x0 = y1;
    y2=x0;
    y1=a*x0.*(1-x0.^2);
    mycomet([x0 x0], [y2 y1], 0.5, 0)
end
xlabel('X')
ylabel('Y')
title('Паутинная диаграмма')
legend('y(x)=a*x*(1-x^2)', 'y=x', 'Лестница Ламерея')
endfunction ch_diag_anim( func, a, x0 )


