function [N_plus,N_minus,N_0] = Modl_lab7_var1(N_neutrons,absorption_s,scattering_s,h)
% ѕервый вариант выполени€ задани€
% ћоделирование истинных траекторий.
% ѕример вызова: Modl_lab7_var1(1000,1,34,0.3)
% ¬ыходные параметры:
% N_plus - кол-во прошедших через пластинку
% N_minus - кол-во отразившихс€
% N_0 - кол-во поглощенных
% ¬ходные параметры:
% N_neutrons - кол-во нейтронов дл€ моделировани€
% absorption_s - сечение поглощени€
% scattering_s - сечение рассе€ни€
% h - толщина пластинки

% ѕолное сечение рассе€ни€
full_s = absorption_s+scattering_s;

% ¬еро€тность поглощени€
Pa = absorption_s/full_s;

% ¬ектор координаты нейтронов
x = zeros(1,N_neutrons); % все нейтроны начинают моделироватьс€
                         % с границы пластинки х = 0
N_plus=0; N_minus=0; N_0=0; % по нул€м все сначала
while(~isempty(x))
    len = length(x);
%     очередное перемещение "живых" нейтронов
    x = x + (-log(1-rand(1,len))/full_s).*(1-2*rand(1,len));
%     провер€ем прохождение пластинки
    x = x(x<=h);
    N_plus = N_plus+len-length(x);
    len = length(x);
%     провер€ем выход из пластинки с входной стороны
    x = x(x>=0);
    N_minus = N_minus+len-length(x);
    len = length(x);
%     провер€ем поглощение
    x = x(rand(1,len)>Pa);
    N_0 = N_0+len-length(x);
end
end