function mean_time = Modl_lab5_var2_p1_balanced(m)
% ��������� �������� ������� ������� ������ ���������
% ��� 2 ������� � m �������

npoints = fix((14/m)^2);
points = zeros(1,npoints);
for i = 1:npoints
    points(i) = Modl_lab5_var2_p1(true,[m,2]);
end
mean_time = median(points);
end
