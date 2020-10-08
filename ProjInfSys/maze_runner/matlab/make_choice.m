function [ring] = make_choice(current_ring)
    assert(current_ring >= 1 && current_ring < 5)
    switch current_ring
        case 1
            ring = 2;
        case 2
            ring = randi(3);
        case 3
            if randi(2) == 1
                ring = 2;
            else
                ring = 4;
            end
        case 4
            if randi(2) == 1
                ring = 3;
            else
                ring = 5;
            end
    end
end