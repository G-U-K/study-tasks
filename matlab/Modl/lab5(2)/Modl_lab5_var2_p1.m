function [spent_time, solution] = Modl_lab5_var2_p1(fill_random, t_ij)
% 1. ����������� ������������ ��������� ������� ������
% �������� ��� ���� ������� ������� ������� ��������.
% 
% ������� ���������:
% fill_random : logical - ��������� �� �������� ������� ���������� �������.
% t_ij - ������� ������ ��������� i-� ������ �� j-� ������
% ��� ���� fill_random == true, �� ������ ����� �������.
% 
% �������� ���������:
% solution - ��������� ������� ������ �������� � ���� ������� 
% ������������������ �������.
% spent_time - ������� ������� ������ ������� ������� �������� � ��������. 
% 
% ������ ������: 
% Modl_lab5_var2_p1(false, [2 5 9 ; 1 4 1 ; 9 1 61 ; 0 12 3])
% Modl_lab5_var2_p1(true, [5,9])

% �������� ��� ��� ��������� logical
if ~islogical(fill_random)
    disp('������ �������� ������ ����� ���������� ���!')
    spent_time=nan;
    return
end

% �������� ������� ���������� �������
if fill_random
    t_ij = rand(t_ij);
end
[m,n] = size(t_ij); % m ������� ,n �������

% ������� ������� ����� ���������� ������ �������� j-� ������
ends = zeros(1,n);
% ������� ������ ����� ��� ���������� solution
best_result = inf;

% ��������� ��� �������� ���� ����������
items = 1:m;
nitems = length(items);
total_combinations = prod(items);

% �������� ������
tic;

% �������
for iter=0:total_combinations-1
%     ��������� ������� ����������
    comb=Modl_lab5_var2_p1_combination(iter,items,nitems,total_combinations);
    % -----������-������������-���������-������-------
    ends(1) = t_ij(comb(1),1);
    for j = 2:n
        ends(j)= ends(j-1)+t_ij(comb(1),j);
    end
    for i = 2:m
        ends(1)=ends(1)+t_ij(comb(i),1);
        for j = 2:n
    %         ��������� �� ������� ������ ������� ������
    %         ���������� ����� �������� ����� ����� �������,
    %         ����� ������������ � ������ � ������ /���()/
            ends(j)= t_ij(comb(i),j)+max(ends(j),ends(j-1));
        end 
    end
    % ------------------------------------------------
    % ---------�����-���������-����������-------------
    if ends(end)<best_result
        best_result = ends(end);
        solution = comb;
    end
    % ------------------------------------------------
end

spent_time = toc;
end