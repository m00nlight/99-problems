repeat(N, Elem, Xs) :- repeat(Elem, N, [], Xs).

repeat(_, 0, Acc, Acc).
repeat(Elem, N, Acc, Xs) :-
    N1 is N - 1,
    repeat(Elem, N1, [Elem|Acc], Xs), !.

repli(Xs, N, Ys) :-
    N >= 0,
    maplist(repeat(N), Xs, Zs),
    flatten(Zs, Ys).


