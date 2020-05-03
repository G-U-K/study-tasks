function Modl_lab2_main(dt,timelim,m)
% Строит графики в полярных координатах
% и в декартовых.
% dt - шаг по времени;
% timelim - конечный момент времени;
% m - масса, есть в уравнении.
% Пример # Modl_lab2_main(1,50,312 как город)
% Красиво # Modl_lab2_main(0.15,50,14)


[phi, r] = Modl_lab2_sub_1(dt,timelim,m);
x=r.*cos(phi);
y=r.*sin(phi);

figure
polar(phi,r)
title('Траектория частицы массой m (полярные координаты)')
figure
plot(x,y),grid
title('Траектория частицы массой m (декартовы координаты)')
xlabel('x \rightarrow')
ylabel('y \rightarrow')
% ОБРАБОТКА ГРАФИКА КРАСОТАААА!!!
end