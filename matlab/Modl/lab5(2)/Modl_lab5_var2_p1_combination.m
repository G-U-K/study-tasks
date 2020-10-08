function result = Modl_lab5_var2_p1_combination(iteration,items,nitems,combinations)
% Функция формирует уникальную комбинацию из заданных элементов
% Modl_lab5_var2_p1_combination(0:combinations-1,[1:n],nitems=n,combinations=prod(1:n))

if nitems ==1
    result = items;
    return
end

block = combinations/nitems;
part = fix(iteration/block);

item = items(part+1);

result = [item,Modl_lab5_var2_p1_combination(iteration-part*block,items(items~=item),nitems-1,block)];
end
    