function res = IPST_lab2_p3(m,n,k,id)
% ������� ���������� ������� �
% ������������� � ���������� � ��������� ������� �� ����� ������. ��������
% ������������� ������� �� �������� ��������� ������������� id:
% � id = �digit� � ������� ����������� ������� 1 � 0;
% � id = �char� � ������� ����������� ������� �1� � �0�.
% ������� ��������� � ��� ����������� ������� �� ��� �����������,
% �������������; �������� � ���� �������.
m = input('����������� ������� x:\n');
n = input('����������� ������� y:\n');
k = input('����������� ������� z:\n');
id=input('�����������(digit,char):\n','s');
if strcmpi(id,'digit')
    res = zeros(m,n,k);
    res(:,:,1:2:end)=1;
    for ts =0:1
        for tp =0:1
            res(1+tp:2:end,1+tp:2:end,1+ts:2:end)=ts;
        end
    end
elseif strcmpi('char',id)
    res = repmat({'0'},m,n,k);
    res(:,:,1:2:end)={'1'};
    for ts =0:1
        for tp =0:1
            res(1+tp:2:end,1+tp:2:end,1+ts:2:end) = num2cell(num2str(ts));
        end
    end
else
    disp('������������ �������� id')
end
end