function mean_time = Modl_lab5_var2_p2_balanced(m)
% ��������� �������� ������� ������� ������ ���������� ��������
% ��� 2 ������� � m �������

npoints = (62-m)*2;
points = zeros(1,npoints);
for i = 1:npoints
    points(i) = Modl_lab5_var2_p2(true,m);
end
mean_time = median(points);
end