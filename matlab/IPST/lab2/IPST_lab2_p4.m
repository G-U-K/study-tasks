function res = IPST_lab2_p4()
% ������� ��������� �������,
% ����������� ���������� ������ ������� (�� 0 �� 10) � ����������
% �������������� ������������ �������� ����� ���������� ��������� ����
% ������� (�� ����� ���������� ������ �������). 
% �������� �������� ������� �� ��������������:
% � id = �+�
% � id = ���
% � id = �*� (������������ ���������).
% ����������� ������� �� ��� ����������� � ������������� ������������� � 
% ������������ � �������� ������ �������. �������� �������� � ���������� �������.

matrix_size = input('����������� ������� �� ��� ����������� (������ ������):\n');
if ~all(size(matrix_size )==[1,3])
    disp('������������ ����������� �������');
    res = -1;
    return
end

matrix = rand(matrix_size)*10.
id = input('������������� �������� (������ + / - / *):\n','s');

dim = 1; % ���������� �������� ����� ����� (��������� �������)
% dim = 2; % ���������� �������� ����� �������� (��������� ������)
% dim = 3; % ���������� �������� ����� ������ (��������� ������� ����������� �� ������� �����)

if strcmp('+',id)
    res = sum(matrix,dim);
elseif strcmp('*',id)
    res = prod(matrix,dim);
elseif strcmp('-',id)
    res = diff(matrix, dim);
else
    res=nan;
end

if isnan(res)
    return;
end

res_size = size(res);
% res_size(dim) = 1;
display(res_size);

close all
xlabel('X');
ylabel('Y');
zlabel('Z');
title('�������� ��������� �������')

axis_x = [0, res_size(1)];
axis_y = [0, res_size(2)];
axis_z = [0, res_size(3)];
axis([axis_x axis_y axis_z]);

hold on
grid on

delta = 0.5;
for xi = 1 : 1 : res_size(1)
    for yi = 1 : 1 : res_size(2)
        for zi = 1 : 1 : res_size(3)
            text(xi-delta,yi-delta,zi-delta, num2str(res(xi,yi, zi)));
        end
    end
end
end