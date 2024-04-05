man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
children(X):- parent(X,Y), print(Y), nl, fail.

%parent(+X,?Y) Х - родитель для Y
%children(+X) Х - родитель, вывод детей

mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.
%mother(+X,?Y) Х - мать для Y
%mother(+X) Х - дитё, вывод матери

father(X,Y):- man(X), parent(X,Y).
father(X):- father(Y,X), print(Y), nl, fail.
%father(+X,?Y) Х - отец для Y
%father(+X) Х - дитё, вывод отца

brother(X,Y):- man(X), mother(M,X), mother(M,Y), father(F,X), father(F,Y), not(X=Y).
brother(X):- brother(Y, X), print(Y), nl, fail.
%brother(+X,?Y) Х - брат для Y
%brother(+X) Х - дитё, вывод брата

%sister(X,Y):- woman(X), mother(M,X), mother(M,Y), father(F,X), father(F,Y), not(X=Y).
%sister(X):- sister(Y, X), print(Y), nl, fail.
%sister(+X,?Y) Х - брат для Y
%sister(+X) Х - дитё, вывод брата

b_s(X,Y):- mother(M,X), mother(M,Y), father(F,X), father(F,Y), not(X=Y).
%b_s(+X,?Y) - Проверка на сиблинга через родителей
%b_s(X,Y):- sister(X,Y); brother(X,Y).
%b_s(+X,?Y) - Проверка на сиблинга через братство/сестринство
b_s(X):- b_s(Y, X), print(Y), nl, fail.
%b_s(+X) - Вывод сиблингов

daughter(X,Y):- woman(X), parent(Y,X).
daughter(X):- woman(Y), !, children(X), print(Y), false.
%daughter(+X,+Y) Х - дочь для Y
%daughters(+X) Х - родитель, вывод дочери

wife(X, Y):- mother(X,C), father(Y,C), woman(X).
wife(X):- wife(Y,X),!, print(Y), nl, fail.
%wife(+X,?Y) Х - жена Y
%wife(+X) Х - муж, вывод жены

grand_son(X, Y):- man(X), parent(A,X), parent(Y,A).
grand_sons(X):- man(Y), parent(A,Y), parent(X,A), print(Y), nl, fail.
%grand_son(+X, +Y) Х - внук Y
%grand_sons(+X) Х - хто-то, вывод внуков

grand_ma_and_son(X,Y) :- grand_son(X,Y), woman(Y); grand_son(Y,X), woman(X).
%grand_ma_and_son(+X,+Y) X бабушка, Y внук или наоборот

uncle(X, Y) :- parent(A,Y), brother(X,A).
uncle(X) :- parent(A,X), brother(Y,A), print(Y), nl, fail.
%uncle(+X,?Y) Х - дядя для Y
%uncle(+X) Х - племянник(-ца), вывод дядь
