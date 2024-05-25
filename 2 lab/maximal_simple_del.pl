% max_prime_divisor\0 - найти максимальный простой делитель числа
max_prime_divisor:-
    read_number(Number),
    max_prime_divisor(Number, Result),
    print_result(Result).

% read_number(-Number) - считать число
read_number(Number):- 
    write('Enter the number: '),
    read(Number).

% print_result(+Result) - напечатать результат
print_result(Result):-
    write('Result: '),
    write(Result).

% is_prime(+Number) - определить, является ли число простым
is_prime(Number):- not(Number is 1), not((CheckNumber is Number - 1, between(2, CheckNumber, Step), 0 is mod(Number, Step))).

% max_prime_divisor(+Number, -Result) - найти максимальный простой делитель числа
max_prime_divisor(Number, Result):- not(Number is 1), not(Number is 0), max_prime_divisor(2, Number, 0, Result), not(Result is 0).

max_prime_divisor(Number, Number, _, Result):- is_prime(Number), Result is Number, !.
max_prime_divisor(Number, Number, CurRes, Result):- Result is CurRes, !.

max_prime_divisor(CurNumber, Number, CurRes, Result):- 
    Ost is Number mod CurNumber, 
    Ost is 0, 
    CurNumber > CurRes,
    is_prime(CurNumber),
    NextNumber is CurNumber + 1,
    max_prime_divisor(NextNumber, Number, CurNumber, Result), !.

max_prime_divisor(CurNumber, Number, CurRes, Result):-
    NextNumber is CurNumber + 1,
    max_prime_divisor(NextNumber, Number, CurRes, Result), !.


% nod_max_odd_noprime_and_proizv_digits/0 - Найти НОД максимального нечетного непростого делителя числа и произведения цифр данного числа.
nod_max_odd_noprime_and_proizv_digits:-
    read_number(Number),
    max_odd_noprime_divisor(Number, ResultDivisor),
    proizv_cifr(Number, ResultProiz),
    nod(ResultDivisor, ResultProiz, Result),
    print_result(Result).

% proizv_cifr(+N, -X) - найти произведение цифр числа
proizv_cifr(N, X):- proizv_cifr(N, 1, X).
proizv_cifr(0, X, X):- !.
proizv_cifr(N, CurX, X):- N1 is N // 10, Digit is N mod 10, NewX is CurX * Digit, proizv_cifr(N1, NewX, X), !.

% max_odd_noprime_divisor(+Number, -Result) - найти максимальный непростой нечётный делитель числа
max_odd_noprime_divisor(1, 1).
max_odd_noprime_divisor(Number, Result):- not(Number is 0), max_odd_noprime_divisor(3, Number, 0, Result), not(Result is 0).

max_odd_noprime_divisor(Number, Number, _, Result):- not(is_prime(Number)), OstOdd is Number mod 2, OstOdd is 1, Result is Number, !.
max_odd_noprime_divisor(Number, Number, CurRes, Result):- Result is CurRes, !.

max_odd_noprime_divisor(CurNumber, Number, CurRes, Result):- 
    Ost is Number mod CurNumber, 
    Ost is 0, 
    CurNumber > CurRes,
    OstOdd is CurNumber mod 2,
    not(OstOdd is 0),
    not(is_prime(CurNumber)),
    NextNumber is CurNumber + 1,
    max_odd_noprime_divisor(NextNumber, Number, CurNumber, Result), !.

max_odd_noprime_divisor(CurNumber, Number, CurRes, Result):-
    NextNumber is CurNumber + 1,
    max_odd_noprime_divisor(NextNumber, Number, CurRes, Result), !.