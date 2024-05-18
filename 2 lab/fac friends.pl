% pr_student/0 - решение логической задачи про учеников факультетов
% Три друга – Петр, Роман и Сергей учатся на математическом, физическом и химическом факультетах университета.
% Если Петр математик, то Сергей не физик. Если Роман не физик, то Петр – математик.
% Если Сергей не математик, то Роман – химик. Где учится Роман?
in_list([El|_], El).
in_list([_|T], El):-in_list(T, El).

pr_student:-
        Students=[_,_,_,_],
        in_list(Students,[petr, PF]),
        in_list(Students,[roman, RF]),
        in_list(Students,[sergey, SF]),

        in_list(Students,[_, mathematic]),
        in_list(Students,[_, physicist]),
        in_list(Students,[_, chemick]),

        (
            (PF = mathematic, SF \= physicist);
            (RF \= physicist, PF = mathematic);
            (SF \= mathematic, RF = chemick)
        ),

        write('Roman: '), write(RF), !.