% problem26_with_lists(-Answer) - найти число d от 1 до 1000, с самым длинным период в дроби 1 / d
problem26_with_lists(Answer):- aggregate(max(Len,N),count_length(N,Len),max(_,Answer)).

% period_list(+Digit, -Res) - найти период дроби 1 / Digit - вернуть её в виде списка
period_list(Digit, Res):- NewOst is 10 mod Digit, period_list(Digit, [], NewOst, Res), !.
period_list(_,[],0,[]).
period_list(_, ListOfOst, LastOst, ListOfOst) :- member(LastOst, ListOfOst).
period_list(Digit, ListOfOst, LastOst, Res):- NewOst is 10 * LastOst mod Digit, period_list(Digit, [LastOst | ListOfOst], NewOst, Res).

% count_length(+Digit, -Length) - найти длинну периода дроби 1 / Digit
count_length(Digit,Length) :- between(2, 999, Digit), 
    period_list(Digit, List), 
    length(List, Length), 
    write("Number: "),  
    write(Digit), 
    write(" Length: "), 
    write(Length),
    nl.