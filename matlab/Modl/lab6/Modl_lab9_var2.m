function note = Modl_lab9_var2(niterations)

if(nargin<1)
    niterations = 500; % дефолтное значение
end
t = zeros(1,niterations); % моменты времени
queued = zeros(1,niterations); % длина очереди в моменты времени

% mean service time
% = среднее время обслуживания
mst = 1/0.3; % 1/(интенсивность обслуживания)
lambda = 1.0; % интенсивность поступления требований

% начальное состояние СМО - в каждом обслуживающем
% устройстве есть требование, а очередь пустая.
tools = random('exp',mst,[3,1]); % устройства и оставшееся время обработки в них требований
time_step = min(tools); % наименьшее время обслуживания из имеющихся требований
tools = tools-time_step;
queue1=[];queue2=[];queue3=[]; % очереди пустые изначально
abs_time=0.;

for iter=2:niterations
    abs_time=abs_time+time_step; % текущее время с начала моделирования
    t(iter)=abs_time; % заносим запись
    x=lambda.*time_step;
    aq1=[];aq2=[];aq3=[]; % списки пришедших требований, изначально пусты
    number=rand()-exp(-x); % равномерно распределенное от 0 до 1
    k=0;
    x=lambda.*time_step;
%    цикл чтобы распределить пришедшие требования 
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
    
%    новый вид очередей
    queue1=[queue1, aq1];
    queue2=[queue2, aq2];
    queue3=[queue3, aq3];
    
%     в устройство войдет новое требование, если есть предназначенные
%     устройству требования и само устрйоство свободно
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
    
%    надо установить следующий шаг по времени
    if all(tools<=0)
%         если все устройства пусты, то шаг случайный
        time_step = rand();
    else
%         иначе шаг = минимум времени оставшегося обслуживания у непустых
%         устройств
        g0=tools(tools>0);
        time_step = min(g0);
        tools(tools>0)=g0-time_step;
    end
    
%     запись о суммарной длине очереди в этот момент
      queued(iter) = length(queue1)+length(queue2)+length(queue3);
      
     
end 
figure(4)
note = timeseries(queued,t); % объединили два массива в один объект.
plot(note)
end
