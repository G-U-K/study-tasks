function IPST_lab2_p1()
% ������ ������ ����� ��� ���������� �������� �� ������ ������������.
% � ��� ����� � ��� ������������� � ������ � �������, R.
% � ��� �������� � ��� �������������, ������, ����� ������� ��������� � ����������, h, l.

answer= input('����� ������ ���������?\n �������� �������� � �����. \n','s');
figure

if strcmpi(answer,'�����') % ���������, ���������������� � ��������
    R = input('������:\n');
    [x, y, z]=sphere;
    mesh(R*x,y*R,z*R, 'FaceAlpha', '0.5'),title('�����')
  
    grid on;
    axis equal;
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');
elseif strcmpi(answer,'��������')
    h=input('������:\n');
    l=input('����� ����� ���������:\n');l=l/2;
    [x,y]=meshgrid(linspace(-l,l,41));
    z = h-max(abs(x),abs(y))*h/l;
    z = z.*(z>0);
    mesh(x,y,z,'FaceAlpha', '0.5'),title('������������� ��������')
    my_axis=[-l l]*1.5;
    axis([my_axis my_axis -h/5 h*1.2])
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');

else
    disp('����������� ������� ������')
end
end