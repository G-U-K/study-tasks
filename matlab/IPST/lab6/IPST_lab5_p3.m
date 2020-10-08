function remembered = IPST_lab5_p3(x_start)
% ������ �������������� �������� ���
% ��������� ����������� ����������� �����������.
% cos(2*pi*x_prev)*(-lambda/2.0/pi)+(sqrt(5)-1)/2
% cos(2*pi.*x).*(-a./2./pi)+(sqrt(5)-1)/2
% ������� �������� ������ 0..0.39

% �������� ��� ������ - ������
if ~isscalar(x_start)
    disp('x_start ������ ���� ��������.');
    return
end

% ������ ������� �� ��� ��������������
lambda = linspace(0, 2.25, 800);

% �������� ������� ��������� � ���������� ����� �����������
multX = -lambda/2.0/pi;
addX = (sqrt(5)-1)/2;

% ���������� ������ 200 ��������
x_next = x_start; % ���� ��������� �������� �� 0-��������
for iter=1:200
    x_next = multX.*cos(2*pi*x_next)+addX;
end

% ���������� buffsize ��������� ��������
buffsize = 800; % �������� �� ������������ ���
remembered = zeros(buffsize,length(lambda));
for iter=1:buffsize 
    x_next = multX.*cos(2*pi*x_next)+addX;
    remembered(iter,:) = x_next;
end

% ��������� ������� � ������ � ����������� ��� ���������
x = reshape(repmat(lambda, buffsize,1),1,[]);
y = reshape(remembered,1,[]);

% ����������
scatter(x,y,1)
xlabel('a')
ylabel('f(x)')
ylim([0,1])
title('�������������� �������� ������� f(x)= cos(2*pi.*x).*(-a./2./pi)+(sqrt(5)-1)/2')
end