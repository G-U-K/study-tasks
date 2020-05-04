function IPST_lab7(T)
% T - период, отсчеты по времени 0-10 сек.
% Можно взять например Т = 1.
% В среде MatLab написать функции генерации синусоидального сигнала,
% пилы, меандра. С помощью программы Fractan построить фазовый 
% портрет сигнала, а также рассчитать для этого сигнала показатель Хёрста.

ts = linspace(0,10,10001); % отсчеты времени
% функции для формирования сигналов
my_harmonic = @(t) sin(2*pi./T.*t); % синусоидальный
my_meander = @(t) (mod(t,T)<T./2)-0.5; % меандр
my_sawtooth = @(t) mod(t,T)-0.5; % пилообразный
my_funcs={my_harmonic,my_meander,my_sawtooth};
for my_func = my_funcs
    input('Ввод чтобы продолжить')
    ff=fopen('Sample.dat', 'w');
    fprintf(ff, '%g\r\n', my_func{1}(ts));
    fclose(ff);
    dos('Fractan.exe Sample.dat');
end

end