function count = IPST_lab6_various(vector)
% ���������� ���������� ���������(������������) ����� � �������

% ���� ������� ��� ��� �������
if(~isvector(vector))
    disp('������� �������� ������ ���� ��������/��������!')
    return
end

count=0;

% ���� � ������� �������� �����
while(~isempty(vector))
%     ��������� �� ������� �����
%     ������� ����� �������
    vector = vector(abs(1 - vector./vector(1))<eps.*10); % ��������������
%     vector = vector(vector~=vector(1));
    count = count+1;
end
end