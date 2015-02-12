istree(t(_, Xs)) :- 
    isforest(Xs).

isforest([]).
isforest([H|T]) :-
    istree(H),
    isforest(T).