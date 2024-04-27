main :-
    write('WHO ARE YOU FROM STARDEW VALLEY'),
    retractall(asked(_,_)),
    char(Ask),
    !,
    nl,
    write('Your character is '), write(Ask), write(.), nl.
main :-
    nl,
    write('Get some sleep.'), nl.

ask(non_human) :-
    query('The char is NON-human being. [Yes/No]').

ask(apple) :-
    query('The char is apple-shaped. [Yes/No]').

ask(disabled) :-
    query('The char is disabled. [Yes/No]').

ask(fem) :-
    query('The char is female. [Yes/No]').

ask(seller) :-
    query('The char is selling things or work at store. [Yes/No]').

ask(bach) :-
    query('The char is bachelor_ette. [Yes/No]').

ask(child) :-
    query('The char is child. [Yes/No]').

ask(outer) :-
    query('The char live outside Pelican Town. [Yes/No]').

ask(hated) :-
    write('The char is unliked by fandom* [Yes/No]'),
    query('(*specifically by me, author of quiz)').

char(junimo) :-
    ask(non_human),
    ask(apple).
%при ответе на первый вопрос отпадают 3, 4, 7, 8 и 9; при ответе на второй вопрос отпадают оставшиеся 5 и 6

char(krobus) :-
    ask(non_human),
    ask(seller),
    ask(bach).

char(mysh_v_shlyapi) :-
    ask(non_human),
    ask(seller).

char(goblin) :-
    ask(non_human).

char(emily) :-
    ask(fem),
    ask(seller),
    ask(bach).

char(sandy) :-
    ask(fem),
    ask(seller),
    ask(outer).

char(robin) :-
    ask(fem),
    ask(seller).

char(haley) :-
    ask(fem),
    ask(bach).

char(pam) :-
    ask(fem),
    ask(hated).

char(birdie) :-
    ask(fem),
    ask(outer).

char(jas) :-
    ask(child),
    ask(fem).

char(evelyn) :-
    ask(fem).


char(morris) :-
    ask(seller),
    ask(outer),
    ask(hated).

char(pierre) :-
    ask(seller),
    ask(hated).

char(m_rasmodius) :-
    ask(seller),
    ask(outer).

char(gus) :-
    ask(seller).

char(harvey) :-
    ask(seller),
    ask(bach).

char(elliott) :-
    ask(bach),
    ask(outer).

char(sebastian) :-
    ask(bach).

char(leo) :-
    ask(child),
    ask(outer).

char(vincent) :-
    ask(child).

char(lewis) :-
    ask(hated).

char(linus) :-
    ask(outer).

char(george) :-
    ask(disabled).





query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.


%ъаъаъаъ
