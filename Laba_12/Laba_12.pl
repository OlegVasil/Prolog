read_list(0, []) :- !.
read_list(I, [X|T]) :- read(X), I1 is I - 1, read_list(I1, T).

write_list([]) :- !.
write_list([X|T]) :- write(X), nl, write_list(T).

delete([], _Elem, []):-!.
delete([Elem|Tail], Elem, ResultTail):-
   delete(Tail, Elem, ResultTail), !.
delete([Head|Tail], Elem, [Head|ResultTail]):-
   delete(Tail, Elem, ResultTail).

%____11____%

nod(N,0,N):-!.
nod(N,M,R):-M1 is N mod M,N1 is M,nod(N1,M1,R).

%Вверх%
countSimpleU(A,X):- csU(A,X,A).
csU(A,X,0):-X is 0,!.
csU(A,X,I):- I1 is I-1, csU(A,X1,I1),(nod(A,I1,D),D is 1,X is X1+1;X is X1),!.

%Вниз%
countSimpleD(A,X):- csD(A,X,A,0).
csD(A,R,0,R):-!.
csD(A,X,I,R):- I1 is I-1,(nod(A,I1,D),D is 1,R1 is R+1,csD(A,X,I1,R1);csD(A,X,I1,R)),!.

%____14____%
list_length([],0).
list_length([_|T],L):-list_length(T,Count),L is Count + 1.

%____15____%
append([],X,X).
append([X|T],Y,[X|T1]) :- append(T,Y,T1).
readList(X,Y):-readList([],X,0,Y).
readList(A,A,G,G):-!.
readList(A,B,C,D):- C1 is C+1,read(X),append(A,[X],A1),readList(A1,B,C1,D).

writeList([]):-!.
writeList([H]):-write(H).
writeList([H|T]):- write(H),write(' '),writeList(T).

maxIndexInList([H|T],Max,IndexMax):- maxIndexInList([H|T],H,Max,0,IndexMax,0).
maxIndexInList([],NowMax,Max,NowIndex,IndexMax,Index):-Max is NowMax,IndexMax is NowIndex,!.
maxIndexInList([H|T],NowMax,Max,NowIndex,IndexMax,Index):-
    Index1 is Index+1,
    (
        H >= NowMax,
        maxIndexInList(T,H,Max,Index,IndexMax,Index1);
        maxIndexInList(T,NowMax,Max,NowIndex,IndexMax,Index1)
    ),!.

countAfterMax([Head|Tail],COUNT):- maxIndexInList([Head|Tail],Max,IndexMax), listleng([Head|Tail],Length), COUNT is (Length-1-IndexMax).

task5:- read(N),readlist(List,N),countAfterMax(List,Count),write(Count),!.
