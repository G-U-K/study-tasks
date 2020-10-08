function [win] = maze_runner(moves)
%Функция, проходящая лабиринт
    assert(moves >= 0)
    if moves < 5
        win = 0;
    else
        ring = 1;
        for move = 0:moves
            ring = make_choice(ring);
            if (ring == 5)
                break
            end
        end
        
        if ring == 5
            win = 1;
        else
            win = 0;
        end
    end
end