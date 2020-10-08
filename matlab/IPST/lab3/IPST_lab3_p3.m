function diff_expr = IPST_lab3_p3(a,b,c,varargin)
% ��������� ����������� �������� ������ ������� � 
% ������� ������ �������� ������� � �����������. 
% ������� ��������� � ������������ �������� ax^2+bx+c.
% ����� ������� ������� ��������� ��� ���������� �������

% ��������� �� ������������ ���������� ������� ����������
if nargin<4
    narginchk(3,3);
    xmin=-10.;
    xmax=10.;
else
    narginchk(5,5);
    xmin=varargin{1};
    xmax=varargin{2};
end

% ���������� ���������
syms x;
y_expr = a.*x.^2+b.*x+c;
diff_expr=diff(y_expr);

% ����������� � ����������� �������
y_func = matlabFunction(y_expr);
diff_func = matlabFunction(diff_expr);

% ���������� �������
samples=linspace(xmin,xmax,50);
plot(samples,y_func(samples),samples,diff_func(samples));
legend('�������� �������','�����������'),grid
title('������ �������� � ����������� �������')
xlabel('x,\rightarrow')
ylabel('y,\rightarrow')

end