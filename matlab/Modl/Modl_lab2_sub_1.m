function [phi, r] = Modl_lab2_sub_1(dt,timelim,m)
% ��������� ���������� ����� � �������� �����������
% dt - ��� �� �������;
% timelim - �������� ������ �������;
% m - �����, ���� � ���������.
% ������ # Modl_lab2_sub_1(1,50,312 ��� �����)

t = 0:dt:timelim;

phi=t;

r=zeros(size(t));
r(1)=1; % ��������� �������
r_diff=0; % ��������� �������
for idx=2:length(r)
    r(idx)=r(idx-1)+dt.*r_diff;
    r_diff=r_diff-dt./(m.*(r(idx-1)).^2);
end
end