function IPST_lab2_p2(fig_kind,r,h)
% ������ ������ ���� ��� ������ �� ������ ������������.
% IPST_lab2_p2(fig_kind,r,h)
% � ��� ���� � ��� ������������� � ����� ����� � ����, r.
% � ��� ������ � ��� �������������, ������, ������ ��������� � ������, h, r.
fig_kind=input('������� ������(��� / �����):\n','s');
figure;
if strcmpi(fig_kind,'���')
    r = input('����� ����� ����:\n');
    X = [0 r 0 0 0 0; r r r 0 r r; r r r 0 r r; 0 r 0 0 0 0];
    Y = [0 0 0 0 0 r;0 r 0 0 0 r; 0 r r r r r; 0 0 r r r r];
    Z = [0 0 r 0 0 0; 0 0 r r 0 0; r r r r 0 r; r r r 0 0 r];
    r=r/2;
    mesh(X-r,Y-r,Z-r, 'FaceAlpha', '0.2'),title('���')
    axis([-r r -r r -r r]*1.5)
    hidden on
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');
elseif strcmpi(fig_kind,'�����')
    h=input('������ ������:\n');
    r=input('������ ��������� ������:\n');
    [x,y]=meshgrid(linspace(-2*r,2*r,41));
    z = h-sqrt(x.^2+y.^2)*h/r;
    mesh(x,y,z,'FaceAlpha', '0.5'),title('�����')
    c_xy = 1.5;
    c_z = 1.2;
    axis([-c_xy*r c_xy*r -c_xy*r c_xy*r -h/6 c_z*h])
    hidden off
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');
else
    disp('����������� ������� ������')
end
end