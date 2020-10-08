function x = IPST_lab4_p3()
lambda=0.39
x_start=0.05;
% ������ ��������� ��������� ���
% ��������� ����������� ����������� �����������.
% cos(2*pi*x_prev)*(-lambda/2.0/pi)+(sqrt(5)-1)/2
% ������� �������� ������ 0..0.39
% �������� ��� ������ - ������
if ~isscalar(lambda)
    disp('������ ������ ���� ��������.)');
    return
end
% ������� �����������
multX = -lambda/2.0/pi;
addX = (sqrt(5)-1)/2;
x_next = @(x_prev) cos(2*pi*x_prev).*multX+addX;

% x_next = @(x_prev) lambda.*x_prev.*(1-x_prev);
% ��� �������� �� ������� �� �������

% ����� ��� ��������� ���������
dots=20;
dots=dots*2;

% ����� �������� �����������
x = zeros(1,dots+1);
x(1)=x_start;
for it= 2:2:dots
     x(it)=x_next(x(it-1));
     x(it+1)=x(it);
end

% ���������� ��������
figure
% ������� �� ��� �
samples=linspace(0,floor(x_start)+1,256);
plot(samples,samples, 'g', 'LineWidth', 2),hold on
% �������� ��������� ���������
plot(samples,x_next(samples), 'b', 'LineWidth', 1), grid, hold on
plot([x_start x(1:end-1)],[0 x(2:end)], 'r','LineWidth', 1)
xlabel('x')
ylabel('y(x)'),
title('��������� ���������')
legend('y=x','y=cos(2*pi*x)*(-a/2.0/pi)+(sqrt(5)-1)/2','�������� �������')
% axis([0, 1, 0, 0.7])
end