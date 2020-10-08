function [diff_val, y_diff] = IPST_lab3_p1(kind,a,b,point)
% ��������� �������� ����������� � �������� �����.
% ������� ��������� : ������� (kind
% ==1 - ������������������ y=exp(a+b*x), 
% ==2 - ����������������� y=log(a+b*x), 
% ==3 - ����������� y=(b+x)^a),
% point - ���������� �����; 
% �������� � �������� �����������(������).
close all;
syms x;
if kind==1
    y=exp(a+b*x);
elseif kind==2
    y=log(a+b*x);
elseif kind==3
    y=(b+x).^a;
else
    diff_val=nan;
    disp('����������� ��� �������!');
    return
end

y_diff=diff(y);
y_func=matlabFunction(y_diff);
diff_val=y_func(point);

func = ezplot(y);
set(func, 'LineWidth', 2)
hold on
d_func= ezplot(y_diff);
set(d_func, 'LineWidth', 2)
grid on;
xlabel('x');
ylabel('y');
title('������ �������� ������� � �� ����������� ')
legend('�������� �������', '����������� �������')
% ylim([-4 5])
% xlim([-6 6])

end