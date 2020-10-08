function res = IPST_lab3_p6(a,b,c,d,t_instance)
% ��������� �������� � ��������� ����������� ���� � �������� �����.
% ���� �������� �� ������ ����������� ��������� ������� �������.
% ������� ��������� � ������������ �������� at^3+bt^2+ct+d ,
% ���������� ����� t_instance ;
% �������� - �������� �������� � ���������.
close all
% x=0:0.1:max(10, t_instance * 1.5);
% ���������� ������� ��� ���������� �������
syms y(x);
y(x)=sum([a b c d].*[x.^3,x.^2,x,1]);

% ������ ���������� ��������
subplot(311)
ezplot(y)
hold on
scatter(t_instance, double(y(t_instance)), 'rx'),  grid
hold off
title('������ ���������� ��������')
legend('���������� ��������','�������� �����')

% ��������� �������� - ����������� ����������
y_diff=diff(y,x);
res.velocity = double(y_diff(t_instance));

% ������ �������� ��������
subplot(312)
ezplot(y_diff)
hold on
scatter(t_instance, double(y_diff(t_instance)), 'rx'), grid
hold off
title('������ �������� ��������')
legend('�������� ��������','�������� �����')

% ��������� ��������� - ����������� ��������
y_diff=diff(y_diff);
res.acceleration = double(y_diff(t_instance));

% ������ ���������
subplot(313)
ezplot(y_diff);
hold on
scatter(t_instance, double(y_diff(t_instance)), 'rx'), grid
hold off
title('������ ���������')
legend('��������� ��������','�������� �����')

end