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
grand_pa(X,Y):-parent(X,Z),parent(Z,Y),man(X).

%sooooome noise%

%____11____%
son(X,Y):-parent(Y,X), man(X).
son(X):-parent(X,Y), man(Y), write(Y),nl,fail.

%____12____%
sister(X,Y):-mother(Z,X),mother(Z,Y),woman(X),not(X=Y).
sisters(X):-sister(Sis,X),write(Sis),nl,fail.

%____13____%
grand_ma(X,Y):-parent(Z,Y),parent(X,Z),woman(X).
grand_mas(X):-parent(Y,X), parent(Z,Y), woman(Z), write(Z),nl,fail.

%____14____%
grand_pa_and_da(X,Y):-grand_pa(X,Y),woman(Y);grand_pa(Y,X),woman(X).

%____15____%
%Вверх%
maxDigitU(0,0):-!.
maxDigitU(X,M):- X1 is X div 10, maxDigitU(X1,M1),M2 is X mod 10,(M2>M1, M is M2;M is M1),!. 

%____16____%
%Вниз%
maxDigitD(X,M):- maxDigitD(X,0,M).
maxDigitD(0,M,M):-!.
maxDigitD(X,Y,M):-M1 is X mod 10, X1 is X div 10,M1 > Y,!,maxDigitD(X1,M1,M); X2 is X div 10, maxDigitD(X2,Y,M).

%____17____%
%Вверх%
divBy3(0,0):-!.
divBy3(X,M):- X1 is X div 10, divBy3(X1,M1), M2 is X mod 10, (0 is M2 mod 3, M is M2+M1; M is M1),!.

%____18____%
%Вниз%
divBy3D(X,R):-divBy3D(X,0,R).
divBy3D(0,T,T):-!.
divBy3D(X,P,R):-D is X mod 10,0 is D mod 3, P1 is (P + D),  X1 is X div 10, divBy3D(X1,P1,R),!; X2 is X div 10,divBy3D(X2,P,R).

%____19____%
%Вверх%
fibonach(1,1):-!.
fibonach(2,1):-!.
fibonach(N, X):- N1 is N - 1, N2 is N - 2, fibonach(N1, X1), fibonach(N2, X2), X is X1 + X2.

%____20____%
%Вниз%
fibonachD(N,X):-fibonachD(1,1,2,N,X).
fibonachD(_,F,N,N,F):-!.
fibonachD(A,B,K,N,X):- C is A+B, K1 is K+1,fibonachD(B,C,K1,N,X).











