function int_val = IPST_lab3_p2(a,b,c,xmin,xmax)
% ��������� ������� ������, ������������ ��������� ������ �������. 
% ������� ��������� � ������������ �������� ax^2+bx+c, ������� ��������������;
% �������� � �������.

% ����� ������� ������ �������� ������������ ������� integral
% ������ �.�. ��������� �������
array_x = xmin : 0.1 : xmax;
array_y = a*array_x.^2+b*array_x+c;
int_val=abs(integral(@(x) a*x.^2+b*x+c,xmin,xmax));
area(array_x, array_y, 'FaceColor', 'y');

grid on
xlabel('x')
ylabel('y')
title('������� ������, ������������ ��������� ������ �������')
end

