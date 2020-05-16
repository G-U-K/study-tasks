function [spent_time, solution] = Modl_lab5_var2_p2(fill_random, t_ij)
% 2. ����������� ������������ ��������� ������� ������ ��������
% ��� ���� ������� ���������� ��������.
% 
% ������� ���������:
% fill_random : logical - ��������� �� �������� ������� ���������� �������.
% t_ij - ������� ������ ��������� i-� ������ �� j-� ������
% ��� ���� fill_random == true, �� ������ ����� �������.
% 
% �������� ���������:
% solution - ��������� ������� ������ �������� � ���� ������� 
% ������������������ �������.
% spent_time - ������� ������� ������ ���������� �������� � ��������. 
% 
% ������ ������: 
% Modl_lab5_var2_p2(false, [2 5 ; 4 1 ; 9 1 ; 0 3])
% Modl_lab5_var2_p2(true, 5)

% �������� ��� ��� ��������� logical
if ~islogical(fill_random)
    disp('������ �������� ������ ����� ���������� ���!')
    spent_time=nan;
    return
end

% �������� ������� ���������� �������
if fill_random
    t_ij = rand(t_ij,2);
end
[m,n] = size(t_ij); % m ������� ,n �������

if n~=2
    disp('����������� t_ij ������ ���� m x 2 !')
    spent_time=nan;
    return
end

solution = zeros(1,m);
items_not_distributed = 1:m;
rbound=m;lbound=1;

% �������� ������
tic;

while ~isscalar(items_not_distributed)
    [v,row] = min(t_ij(items_not_distributed,:));
    [~,col] = min(v);
    item = items_not_distributed(row(col));
    items_not_distributed =items_not_distributed(items_not_distributed~=item);
    if col==1
        solution(lbound)=item;
        lbound = lbound+1;
    else
        solution(rbound)=item;
        rbound = rbound-1;
    end
end
solution(lbound)=items_not_distributed;

spent_time = toc;
end