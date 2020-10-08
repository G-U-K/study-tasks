function note = Modl_lab9_var2(niterations)

if(nargin<1)
    niterations = 500; % ��������� ��������
end
t = zeros(1,niterations); % ������� �������
queued = zeros(1,niterations); % ����� ������� � ������� �������

% mean service time
% = ������� ����� ������������
mst = 1/0.3; % 1/(������������� ������������)
lambda = 1.0; % ������������� ����������� ����������

% ��������� ��������� ��� - � ������ �������������
% ���������� ���� ����������, � ������� ������.
tools = random('exp',mst,[3,1]); % ���������� � ���������� ����� ��������� � ��� ����������
time_step = min(tools); % ���������� ����� ������������ �� ��������� ����������
tools = tools-time_step;
queue1=[];queue2=[];queue3=[]; % ������� ������ ����������
abs_time=0.;

for iter=2:niterations
    abs_time=abs_time+time_step; % ������� ����� � ������ �������������
    t(iter)=abs_time; % ������� ������
    x=lambda.*time_step;
    aq1=[];aq2=[];aq3=[]; % ������ ��������� ����������, ���������� �����
    number=rand()-exp(-x); % ���������� �������������� �� 0 �� 1
    k=0;
    x=lambda.*time_step;
%    ���� ����� ������������ ��������� ���������� 
    while number > 0
        k=k+1;
        number=number-((x.^k)*exp(-x)/factorial(k));
        new=random('exp',mst);
        switch randi(3)
            case 1
                aq1=[aq1,new];
            case 2
                aq2=[aq2,new];
            otherwise
                aq3=[aq3,new];
        end
    end
    
%    ����� ��� ��������
    queue1=[queue1, aq1];
    queue2=[queue2, aq2];
    queue3=[queue3, aq3];
    
%     � ���������� ������ ����� ����������, ���� ���� ���������������
%     ���������� ���������� � ���� ���������� ��������
    if tools(1)<=0 && ~isempty(queue1)
        tools(1)=queue1(1);
        queue1=queue1(2:end);
    end
    if tools(2)<=0 && ~isempty(queue2)
        tools(2)=queue2(1);
        queue2=queue2(2:end);
    end
    if tools(3)<=0 && ~isempty(queue3)
        tools(3)=queue3(1);
        queue3=queue3(2:end);
    end
    
%    ���� ���������� ��������� ��� �� �������
    if all(tools<=0)
%         ���� ��� ���������� �����, �� ��� ���������
        time_step = rand();
    else
%         ����� ��� = ������� ������� ����������� ������������ � ��������
%         ���������
        g0=tools(tools>0);
        time_step = min(g0);
        tools(tools>0)=g0-time_step;
    end
    
%     ������ � ��������� ����� ������� � ���� ������
      queued(iter) = length(queue1)+length(queue2)+length(queue3);
      
     
end 
figure(4)
note = timeseries(queued,t); % ���������� ��� ������� � ���� ������.
plot(note)
end
