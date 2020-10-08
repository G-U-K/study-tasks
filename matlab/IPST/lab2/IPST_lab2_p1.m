function IPST_lab2_p1()
% Строит график сферы или квадратной пирамиды по выбору пользователя.
% – для сферы – это идентификатор и радиус – ‘сфера’, R.
% – для пирамиды – это идентификатор, высота, длина стороны основания – ‘пирамида’, h, l.

answer= input('Какую фигуру построить?\n Доступны пирамида и сфера. \n','s');
figure

if strcmpi(answer,'сфера') % Сравнение, нечувствительное к регистру
    R = input('Радиус:\n');
    [x, y, z]=sphere;
    mesh(R*x,y*R,z*R, 'FaceAlpha', '0.5'),title('Сфера')
  
    grid on;
    axis equal;
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');
elseif strcmpi(answer,'пирамида')
    h=input('Высота:\n');
    l=input('Длина ребра основания:\n');l=l/2;
    [x,y]=meshgrid(linspace(-l,l,41));
    z = h-max(abs(x),abs(y))*h/l;
    z = z.*(z>0);
    mesh(x,y,z,'FaceAlpha', '0.5'),title('Прямоугольная пирамида')
    my_axis=[-l l]*1.5;
    axis([my_axis my_axis -h/5 h*1.2])
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');

else
    disp('Некорректно указана фигура')
end
end