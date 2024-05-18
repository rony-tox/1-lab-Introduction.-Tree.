%min(+X, +Y, -Z) Z это меньшее между X и Y
min(X, Y, Z) :- X<Y -> (Z is X); Z is Y.

%is_digit(+N) проверка на цифру (принадлежность к {0, 1, 2, 3, 4, 5, 6, 7, 8, 9})
is_digit(N) :- N>=0, N=<9.


%find_min_dig_up(+N, -D) D это наименьшая цифра в N
find_min_dig_up(LastDigit, LastDigit) :- is_digit(LastDigit), !.
find_min_dig_up(N, D) :-
	LessN is N div 10,
	find_min_dig_up(LessN, OtherDigit),
	SomeDigit is N mod 10,
	min(OtherDigit, SomeDigit, D).


%find_min_dig_down(+N, -D) D это наименьшая цифра в N

find_min_dig_down(N, D) :- SomeDigit is N mod 10, find_min_dig_down(N, SomeDigit, D).
find_min_dig_down(0, CurMinDigit, CurMinDigit) :- !.
find_min_dig_down(N, CurMinDigit, D) :- 
	SomeDigit is N mod 10,
	LessN is N div 10,
	min(SomeDigit, CurMinDigit, NewMinDigit),
	find_min_dig_down(LessN, NewMinDigit, D).


%ъ


% mul_not_5(+N, -X) - найти произведение цифр числа, не делящихся на 5
mul_not_5(N, X):- mul_not_5(N, 1, X).
mul_not_5(0, X, X):- !.
mul_not_5(N, CurX, X):- N1 is N // 10, 
                        Digit is N mod 10, 
                        Ost is Digit mod 5, 
                        Ost \= 0,
                        NewX is CurX * Digit, 
                        mul_not_5(N1, NewX, X), !.
mul_not_5(N, CurX, X):- N1 is N // 10, mul_not__5(N1, CurX, X), !.

% nod(+FN, +SN, -R) - найти НОД двух чисел
nod(FN, 0, FN):- !.
nod(_, 0, _):- !, fail.
nod(FN, SN, R):- Ost is FN mod SN, nod(SN, Ost, R).
