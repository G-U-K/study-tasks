function [phi, r] = Modl_lab2_sub_1(dt,timelim,m)
% Вычисляет координату точки в полярных координатах
% dt - шаг по времени;
% timelim - конечный момент времени;
% m - масса, есть в уравнении.
% Пример # Modl_lab2_sub_1(1,50,312 как город)

t = 0:dt:timelim;

phi=t;

r=zeros(size(t));
r(1)=1; % начальные условия
r_diff=0; % начальные условия
for idx=2:length(r)
    r(idx)=r(idx-1)+dt.*r_diff;
    r_diff=r_diff-dt./(m.*(r(idx-1)).^2);
end
end