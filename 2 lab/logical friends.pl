%in_list(?List, ?El) - если El унифицирована, то проверить, входит ли данный элемент в массив
% если El не унифицирован, будут возвращать все элементы по очереди, до точки.
% если List не унифицирован, будет возвращён список с El.
in_list([El|_], El).
in_list([_|T], El):-in_list(T, El).

% Решение логической задачки.
% На заводе работали три друга: слесарь, токарь и сварщик. Их фамилии
% Борисов, Иванов и Семенов. У слесаря нет ни братьев, ни сестер. Он самый младший из
% друзей. Семенов, женатый на сестре Борисова, старше токаря. Назвать фамилии слесаря,
% токаря и сварщика.
% pr_friends/0
pr_friends:- 
    Friends = [_, _, _],
    in_list(Friends, [_, turner, _, _]),
    in_list(Friends, [_, locksmith, no_sister, youngest]),
    in_list(Friends, [_, welder, _, _]),

    in_list(Friends, [ivanov, _, _, _]),
    in_list(Friends, [semenov, _, zhenat, oldest]),
    in_list(Friends, [borisov, _, have_sister, _]),

    in_list(Friends, [_, turner, _, middle]),


    in_list(Friends, [ivanov, ProfIvanov, StatusIvanov, AgeIvanov]),
    in_list(Friends, [semenov, ProfSemenov, StatusSemenov, AgeSemenov]),
    in_list(Friends, [borisov, ProfBorisov, StatusBorisov, AgeBorisov]),
    write("ivanov:"),write(ProfIvanov),write(" "), nl,
    write("semenov:"),write(ProfSemenov),write(" "),nl,
    write("borisov:"),write(ProfBorisov), write(" "),nl,!.