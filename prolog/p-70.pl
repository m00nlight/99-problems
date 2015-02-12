istree(t(_, Xs)) :- 
    isforest(Xs).

isforest([]).
isforest([H|T]) :-
    istree(H),
    isforest(T).
    
    
nnodes(t(_, []), 1) :- !.
nnodes(t(_, Xs), Res) :-
    maplist(nnodes, Xs, Temp),
    foldl(plus, Temp, 0, Res0),
    Res is Res0 + 1.