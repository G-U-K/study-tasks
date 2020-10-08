function note = Modl_lab9_var1(niterations)

if(nargin<1)
    niterations = 500; % дефолтное значение
end
t = zeros(1,niterations); % моменты времени
queued = zeros(1,niterations); % длина очереди в моменты времени

% mean service time
% = среднее время обслуживания
mst = 1/0.9; % 1/(интенсивность обслуживания)
lambda = 1.0; % интенсивность поступления требований

% начальное состояние СМО - в обслуживающем устройстве есть требование, а
% очередь пустая.
time_step = random('exp',mst); % время обслуживания единственного имеющиегося требования
queue=[time_step]; % очередь требований, голова которой находится уже в устройстве
abs_time=0.;

for iter=2:niterations
    abs_time=abs_time+time_step; % текущее время с начала моделирования
    t(iter)=abs_time; % заносим запись
    number=rand(); % равномерно распределенное от 0 до 1
    k=-1; % количество добавляющихся требований
    x=lambda.*time_step;
%     цикл чтобы определить сколько пришло требований
    while number > 0
        k=k+1;
        number=number-((x.^k)*exp(-x)/factorial(k));
    end
    new_rqs=random('exp',mst,[1,k]); % времена обслуживания пришедших требований
%     надо определить следующий шаг по времени
    if length(queue)>1
        time_step=queue(2);
    else
        if k
            time_step=new_rqs(1);
        else
            time_step=rand();
        end
    end
%     первое требование обслужено, а новые - в конец очереди
    queue=[queue(2:end), new_rqs]; 
    queued(iter) = length(queue); % запись о длине очереди в этот момент
   
end
figure(2)
note = timeseries(queued,t); % объединили два массива в один объект.
plot(note)
end