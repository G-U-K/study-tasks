function count = IPST_lab6_various(vector)
% возвращает количество различных(отличающихся) чисел в векторе

% если входной арг это матрица
if(~isvector(vector))
    disp('Входной аргумент должен быть вектором/скаляром!')
    return
end

count=0;

% пока в векторе остаются числа
while(~isempty(vector))
%     исключаем из вектора числа
%     которые равны первому
    vector = vector(abs(1 - vector./vector(1))<eps.*10); % альтернативное
%     vector = vector(vector~=vector(1));
    count = count+1;
end
end