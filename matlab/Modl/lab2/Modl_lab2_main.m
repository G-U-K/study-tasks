function Modl_lab2_main(dt,timelim,m)
% ������ ������� � �������� �����������
% � � ����������.
% dt - ��� �� �������;
% timelim - �������� ������ �������;
% m - �����, ���� � ���������.
% ������ # Modl_lab2_main(1,50,312 ��� �����)
% ������� # Modl_lab2_main(0.15,50,14)


[phi, r] = Modl_lab2_sub_1(dt,timelim,m);
x=r.*cos(phi);
y=r.*sin(phi);

figure
polar(phi,r)
title('���������� ������� ������ m (�������� ����������)')
figure
plot(x,y),grid
title('���������� ������� ������ m (��������� ����������)')
xlabel('x \rightarrow')
ylabel('y \rightarrow')
% ��������� ������� ����������!!!
end