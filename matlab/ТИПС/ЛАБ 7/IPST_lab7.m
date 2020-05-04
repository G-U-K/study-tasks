function IPST_lab7(T)
% T - ������, ������� �� ������� 0-10 ���.
% ����� ����� �������� � = 1.
% � ����� MatLab �������� ������� ��������� ��������������� �������,
% ����, �������. � ������� ��������� Fractan ��������� ������� 
% ������� �������, � ����� ���������� ��� ����� ������� ���������� ո����.

ts = linspace(0,10,10001); % ������� �������
% ������� ��� ������������ ��������
my_harmonic = @(t) sin(2*pi./T.*t); % ��������������
my_meander = @(t) (mod(t,T)<T./2)-0.5; % ������
my_sawtooth = @(t) mod(t,T)-0.5; % ������������
my_funcs={my_harmonic,my_meander,my_sawtooth};
for my_func = my_funcs
    input('���� ����� ����������')
    ff=fopen('Sample.dat', 'w');
    fprintf(ff, '%g\r\n', my_func{1}(ts));
    fclose(ff);
    dos('Fractan.exe Sample.dat');
end

end