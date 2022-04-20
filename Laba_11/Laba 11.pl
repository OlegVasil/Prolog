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

man:-man(X),write(X),nl,fail.
woman:-woman(X),write(X),nl,fail.
children(X,Y):-parent(X,Y),write(Y),nl,fail.
mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y),nl,fail.
brother(X,Y):-mother(Z,X), mother(Z,Y), man(X), not(X=Y).
brother(X):-brother(Bro,X),write(Bro), nl, fail.
b_s(X,Y):-mother(Z,X), mother(Z,Y), not(X=Y).
b_s(X):-b_s(X,Y), write(Y),nl,fail.
grandpa(X):-parent(Y,X), parent(Z,Y), man(Z),write(Z),nl,fail.

%sooooome noise%
%_____11____%
son(X,Y):-parent(Y,X), man(X).
son(X):-parent(X,Y), man(Y), write(Y),nl,fail.












