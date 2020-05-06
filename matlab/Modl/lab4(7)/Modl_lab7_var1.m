function [N_plus,N_minus,N_0] = Modl_lab7_var1(N_neutrons,absorption_s,scattering_s,h)
% ������ ������� ��������� �������
% ������������� �������� ����������.
% ������ ������: Modl_lab7_var1(1000,1,34,0.3)
% �������� ���������:
% N_plus - ���-�� ��������� ����� ���������
% N_minus - ���-�� ������������
% N_0 - ���-�� �����������
% ������� ���������:
% N_neutrons - ���-�� ��������� ��� �������������
% absorption_s - ������� ����������
% scattering_s - ������� ���������
% h - ������� ���������

% ������ ������� ���������
full_s = absorption_s+scattering_s;

% ����������� ����������
Pa = absorption_s/full_s;

% ������ ���������� ���������
x = zeros(1,N_neutrons); % ��� �������� �������� ��������������
                         % � ������� ��������� � = 0
N_plus=0; N_minus=0; N_0=0; % �� ����� ��� �������
while(~isempty(x))
    len = length(x);
%     ��������� ����������� "�����" ���������
    x = x + (-log(1-rand(1,len))/full_s).*(1-2*rand(1,len));
%     ��������� ����������� ���������
    x = x(x<=h);
    N_plus = N_plus+len-length(x);
    len = length(x);
%     ��������� ����� �� ��������� � ������� �������
    x = x(x>=0);
    N_minus = N_minus+len-length(x);
    len = length(x);
%     ��������� ����������
    x = x(rand(1,len)>Pa);
    N_0 = N_0+len-length(x);
end
end