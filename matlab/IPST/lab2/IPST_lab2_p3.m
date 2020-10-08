function res = IPST_lab2_p3(m,n,k,id)
% —оздает трехмерную матрицу и
% УраскрашиваетФ еЄ значени€ми в шахматном пор€дке по всему объему. «начение
% раскрашивани€ завис€т от входного параметра идентификации id:
% Ц id = СdigitТ Ц матрица заполн€етс€ числами 1 и 0;
% Ц id = СcharТ Ц матрица заполн€етс€ буквами С1Т и С0Т.
% ¬ходные параметры Ц это размерность матрицы по трЄм координатам,
% идентификатор; выходной Ц сама матрица.
m = input('–азмерность матрицы x:\n');
n = input('–азмерность матрицы y:\n');
k = input('–азмерность матрицы z:\n');
id=input('«аполнитель(digit,char):\n','s');
if strcmpi(id,'digit')
    res = zeros(m,n,k);
    res(:,:,1:2:end)=1;
    for ts =0:1
        for tp =0:1
            res(1+tp:2:end,1+tp:2:end,1+ts:2:end)=ts;
        end
    end
elseif strcmpi('char',id)
    res = repmat({'0'},m,n,k);
    res(:,:,1:2:end)={'1'};
    for ts =0:1
        for tp =0:1
            res(1+tp:2:end,1+tp:2:end,1+ts:2:end) = num2cell(num2str(ts));
        end
    end
else
    disp('Ќекорректный параметр id')
end
end