max3(X,Y,U,X):-X>Y,X>U,!.
max3(_,Y,U,Y):-Y>U,!.
max3(_,_,U,U).

%max3(+X:int, +Y:int, +U:int, -Z:int) найти максимум из 3-х чисел

up_fact(0,1):-!.
up_fact(N,X):-N1 is N-1,fact(N1,X1), X is N*X1.

%up_fact(+N:int, -X:int) факториал, рекурсия вверх

down_factor(N,X):-down_fact(0,1,N,X).
down_fact(N,Y,N,Y):-!.
down_fact(N,_,N,_):-!,fail.
down_fact(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).

%down_factor(+N:int, -X:int) факториал, рекурсия вниз

%ъ

%sum_dig_up(+N, ?Sum) и sum_dig_down(+N, ?Sum) сумма цифр числа N или проверка на неё

sum_dig_up(0, 0) :- !.
sum_dig_up(N, Sum) :- LessN is N div 10, sum_dig(LessN, OldSum), Digit is N mod 10, Sum is OldSum+Digit.

sum_dig_down(N, Sum) :- sum_dig_down(N, 0, Sum).
sum_dig_down(0, Sum, Sum) :- !.
sum_dig_down(N, CurSum, Sum) :- 
	LessN is N div 10,
	Digit is N mod 10,
	NewCurSum is CurSum+Digit,
	sum_dig_down(LessN, NewCurSum, Sum).

%square_free(+Х) проверка на свободу от квадратов

square_free(X) :- X>1, not(square_free(2, X)).
square_free(N, X) :- N*N =< X, (0 is mod(X, N*N); N1 is N + 1, free_of_squares(N1, X).


%read_list(-List) считывает список с клавиатуры.
read_list(List) :- read_list([], List).

read_list(Acc, List) :-
    write('Enter an element (or press Enter to finish): '),
    read_line_to_string(user_input, Input),
    (   
	Input = "" ->  reverse(Acc, List);
	(   atom_number(Input, Element)-> true; Element = Input),
        append(Acc, [Element], NewAcc),
        read_list(NewAcc, List)
    ).

%write_list(+List) выводит список на экран.

write_list([]) :- !.
write_list([H|Tail]) :- write(H), nl, write_list(Tail).


%sum_list_down(+List, -Summ) - сумма Summ элементов списка List (рекурсия вниз).

sum_list_down(List, Summ) :- sum_list_down(0, List, Summ).
sum_list_down(Acc, [], Acc).
sum_list_down(Acc, [H|Tail], Summ) :- NewAcc is Acc + H, sum_list_down(NewAcc, Tail, Summ).

%предикат sum_list_up(+List, -Sum) - сумма Summ элементов списка List (рекурсия вниз).

sum_list_up([], 0).
sum_list_up([H|T], Sum) :- sum_list_up(T, AccSum), Sum is AccSum + H.


%remove_items_with_digit_sum(+List, +Sum, -Result) удаляет из списка List элементы, сумма цифр которых равна Sum.
remove_items_with_digit_sum([], _, []).
remove_items_with_digit_sum([H|T], Sum, Result) :-
    digit_sum(H, DigitSum),
    (   DigitSum =:= Sum
    ->  remove_items_with_digit_sum(T, Sum, Result)
    ;   Result = [H|NewResult],
        remove_items_with_digit_sum(T, Sum, NewResult)
    ).
