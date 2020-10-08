function note = Modl_lab10_Reg(niterations)

if(nargin<1)
    niterations = 500; % ��������� ��������
end
t = zeros(1,niterations); % ������� �������
queued = zeros(1,niterations); % ����� ������� � ������� �������

% mean service time
% = ������� ����� ������������
mst = 1/0.95; % 1/(������������� ������������)
mpt = 1/1.0; % 1/(������������� ����������� ����������)

% ��������� ��������� ��� - � ������������� ���������� ���� ����������, �
% ������� ������.
time_step = random('exp',mst); % ����� ������������ ������������� ����������� ����������
queue=[time_step]; % ������� ����������, ������ ������� ��������� ��� � ����������
abs_time=0.; abs_k=0;

for iter=2:niterations
    abs_time=abs_time+time_step; % ������� ����� � ������ �������������
    t(iter)=abs_time; % ������� ������
    k = fix(abs_time*mpt)-abs_k;
    abs_k=abs_k+k;
    new_rqs=random('exp',mst,[1,k]); % ������� ������������ ��������� ����������
%     ���� ���������� ��������� ��� �� �������
    if length(queue)>1
        time_step=queue(2);
    elseif k
        time_step=new_rqs(1);
    else
        time_step=1-mod(abs_time,mpt)+eps;
    end
%     ������ ���������� ���������, � ����� - � ����� �������
    queue=[queue(2:end), new_rqs]; 
    queued(iter) = length(queue); % ������ � ����� ������ � ���� ������
end
figure(2)
note = timeseries(queued,t); % ���������� ��� ������� � ���� ������.
plot(note)
end