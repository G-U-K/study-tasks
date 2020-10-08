function note = Modl_lab9_var1(niterations)

if(nargin<1)
    niterations = 500; % ��������� ��������
end
t = zeros(1,niterations); % ������� �������
queued = zeros(1,niterations); % ����� ������� � ������� �������

% mean service time
% = ������� ����� ������������
mst = 1/0.9; % 1/(������������� ������������)
lambda = 1.0; % ������������� ����������� ����������

% ��������� ��������� ��� - � ������������� ���������� ���� ����������, �
% ������� ������.
time_step = random('exp',mst); % ����� ������������ ������������� ����������� ����������
queue=[time_step]; % ������� ����������, ������ ������� ��������� ��� � ����������
abs_time=0.;

for iter=2:niterations
    abs_time=abs_time+time_step; % ������� ����� � ������ �������������
    t(iter)=abs_time; % ������� ������
    number=rand(); % ���������� �������������� �� 0 �� 1
    k=-1; % ���������� ������������� ����������
    x=lambda.*time_step;
%     ���� ����� ���������� ������� ������ ����������
    while number > 0
        k=k+1;
        number=number-((x.^k)*exp(-x)/factorial(k));
    end
    new_rqs=random('exp',mst,[1,k]); % ������� ������������ ��������� ����������
%     ���� ���������� ��������� ��� �� �������
    if length(queue)>1
        time_step=queue(2);
    else
        if k
            time_step=new_rqs(1);
        else
            time_step=rand();
        end
    end
%     ������ ���������� ���������, � ����� - � ����� �������
    queue=[queue(2:end), new_rqs]; 
    queued(iter) = length(queue); % ������ � ����� ������� � ���� ������
   
end
figure(2)
note = timeseries(queued,t); % ���������� ��� ������� � ���� ������.
plot(note)
end