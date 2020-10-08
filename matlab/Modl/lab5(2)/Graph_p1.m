array_m = 7:1:12;
array_time = zeros(size(array_m));
for i=1:length(array_m)
    m=array_m(i);
    array_time(i)= Modl_lab5_var2_p2_balanced(m);
end
plot (array_m, array_time),grid
title('Зависимость от количества деталей')
ylabel('Время решения')
xlabel('Количество деталей')
