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

number15:- read(N),readlist(List,N),countAfterMax(List,Count),write(Count),!.

%____16____%
minIndexInList([H|T],Min,IndexMin):- minIndexInList([H|T],H,Min,0,IndexMin,0).
minIndexInList([],NowMin,Min,NowIndex,IndexMin,Index):-Min is NowMin,IndexMin is NowIndex,!.
minIndexInList([H|T],NowMin,Min,NowIndex,IndexMin,Index):-
    Index1 is Index+1,
    (
        NowMin >= H,
        minIndexInList(T,H,Min,Index,IndexMin,Index1);
        minIndexInList(T,NowMin,Min,NowIndex,IndexMin,Index1)
    ),!.

makeEmptyList([]).

cutList(List,From,To,NewList):-cutList(List,From,To,NewList,0).
cutList([],From,To,NewList,I):-makeEmptyList(NewList),!.
cutList([H|T],From,To,NewList,I):-
    I1 is I+1,
    (
        I>=From,
        (
            I<To,
            cutList(T,From,To,NewList1,I1),
            append([H],NewList1,NewList);
            makeEmptyList(NewList)
        );
        cutList(T,From,To,NewList,I1)
    ),
    !.

takeOnIndex(List,Index,Elem):-takeOnIndex(List,Index,Elem,0).
takeOnIndex([H|T],Index,Elem,I):-
    I1 is I+1,
    (
        I is Index,
        Elem is H;
        takeOnIndex(T,Index,Elem,I1)
    ),
    !.

swapList(List,NewList):-listleng(List,Length),Length1 is Length-1,swapList(List,NewList,Length1).
swapList(List,NewList,-1):-makeEmptyList(NewList),!.
swapList(List,NewList,I):-
    takeOnIndex(List,I,Elem),
    I1 is I-1,
    swapList(List,NewList1,I1),
    append([Elem],NewList1,NewList),
    !.

swapBetweenMinAndMax(List,NewList):-
    listleng(List,Length),
    maxIndexInList(List,Max,IndexMax),
    minIndexInList(List,Min,IndexMin),
    (
        IndexMax < IndexMin,

        IndexMax1 is IndexMax+1,
        cutList(List,0,IndexMax1,FirstPart),
        cutList(List,IndexMax1,IndexMin,SecondPart),
        cutList(List,IndexMin,Length,ThirdPart);
        
        IndexMin1 is IndexMin+1,
        cutList(List,0,IndexMin1,FirstPart),
        cutList(List,IndexMin1,IndexMax,SecondPart),
        cutList(List,IndexMax,Length,ThirdPart)
    ),
    swapList(SecondPart,SwapedSecondPart),
    append(FirstPart,SwapedSecondPart,FSPart),
    append(FSPart,ThirdPart,NewList).

number16:- read(N),readList(List,N),swapBetweenMinAndMax(List,NewList),writeList(NewList),!.

%____17____%
countElemBetweenAB([],A,B,Count):-Count is 0,!.
countElemBetweenAB([H|T],A,B,Count):-
    (
        H<B,
        H>A,
        countElemBetweenAB(T,A,B,Count1),
        Count is Count1+1;
        countElemBetweenAB(T,A,B,Count)
    ).
