function res = IPST_lab3_p4(coeffs,varargin)
% ������� ���������� �������� 3-�� �������.
% ������� ��������� � ������������ ��������,
% ����������� ������� ��������� ��� ���������� �������;
% �������� � ���������� �����������.

% ��������� �� ������������ ������� ���������

if nargin<2
    narginchk(1,1);
    xmin=-5.;
    xmax=5.;
else
    narginchk(3,3);
    xmin=varargin{1};
    xmax=varargin{2};
end

% ��������� ������ �������������
if any(size(coeffs)~=[1,4])
    disp('������ ������������� ������ ���� ����� (1,4)');
    res=nan;
    return
end
% ���������� ������� ��� ���������� �������
syms y(x);
y(x)=sum(coeffs.*[x.^3,x.^2,x,1]);

% ���� ����������
y_diff=diff(y);

res=transpose(double(solve(y_diff(x),x)));
xmin=min(xmin, res(1));
xmax=max(xmax, res(2));

% ������ ������ ��������
figure
samples=linspace(xmin,xmax);
samples_y=double(y(samples));
plot(samples,samples_y),grid

title('������ �������� 3-�� �������')
xlabel('x,\rightarrow')
ylabel('y,\rightarrow')

ymin=min(samples_y);
ymax=max(samples_y);
axis([xmin, xmax, ymin, ymax])

% �������� ����� ���������� �� �������, ���� ��� ����
if all(isreal(res))
    hold on
    grid on
    % �������� ������� ��� ��������� ����������
    borders=minmax([res, samples(1), samples(length(samples))]);
    
    % ����������� ����������
    not_borders=setdiff(res, borders);
    not_borders_y=double(y(not_borders));
    scatter(not_borders,not_borders_y,'rx')   
    for i=1:length(not_borders)
        x_ = not_borders(i);
        y_ = not_borders_y(i);
        text(x_-1.2, y_-20, sprintf('(%.2f;%.2f)', x_, y_))
    end
    
    % ����������� �������
    borders_y=double(y(borders));
    scatter(borders, borders_y, 'rx')
    delta_x = [+0.2, -2.25];
    delta_y = [+20, -10];
    for i=1:length(borders)
        x_ = borders(i);
        y_ = borders_y(i);
        text(x_ + delta_x(i), y_ + delta_y(i), sprintf('(%.2f;%.2f)', x_, y_))
    end
    legend('������� ��������','����� ����������')
else
    disp('��� �����������')
end
end