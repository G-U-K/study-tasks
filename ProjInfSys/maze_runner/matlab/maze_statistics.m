%Подсчитываем вероятность выигрыша в зависимости от количества ходов и
%выводим график
games_n = 10^3;
assert(games_n > 0)

moves_n = 40;
assert(moves_n > 0)

moves = 0:moves_n;
victories = zeros(1, moves_n+1);
for game=0:games_n
    %arrayfun(@(x-анонимная функция, генерирующая значения до указанного диапазона moves )
    victories_in_this_game = arrayfun(@(x) maze_runner(x), moves);
    victories = victories + victories_in_this_game;
end

win_rate = victories / games_n;
figure
plot(moves,win_rate*100),grid
