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

%parent(X,Y) Х - родитель для Y
%children(X) Х - родитель, вывод детей

mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.
%mother(X,Y) Х - мать для Y
%mother(X) Х - дитё, вывод матери

father(X,Y):- man(X), parent(X,Y).
father(X):- father(Y,X), print(Y), nl, fail.
%father(X,Y) Х - отец для Y
%father(X) Х - дитё, вывод отца

brother(X,Y):- man(X), mother(M,X), mother(M,Y), father(F,X), father(F,Y), not(X=Y).
brother(X):- brother(Y, X), print(Y), nl, fail.
%brother(X,Y) Х - брат для Y
%brother(X) Х - дитё, вывод брата

%sister(X,Y):- woman(X), mother(M,X), mother(M,Y), father(F,X), father(F,Y), not(X=Y).
%sister(X):- sister(Y, X), print(Y), nl, fail.
%sister(X,Y) Х - брат для Y
%sister(X) Х - дитё, вывод брата

b_s(X,Y):- mother(M,X), mother(M,Y), father(F,X), father(F,Y), not(X=Y).
%Проверка на сиблинга через родителей
%b_s(X,Y):- sister(X,Y); brother(X,Y).
%Проверка на сиблинга через братство/сестринство
b_s(X):- b_s(Y, X), print(Y), nl, fail.
%Вывод сиблингов
