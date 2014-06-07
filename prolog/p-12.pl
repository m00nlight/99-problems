:- ensure_loaded('p-10').
:- ensure_loaded('p-11').

repeat(X, N, Xs) :- repeat(X, N, Xs, []).
repeat(_, 0, Acc, Acc) :- !.
repeat(X, N, Xs, Acc) :-
    N1 is N - 1,
    repeat(X, N1, Xs, [X|Acc]).

reconstruct(X, X) :- atom(X), !.
reconstruct([N, X], Xs) :-
    repeat(X, N, Xs).

decode_modify(Xs, Ys) :-
    maplist(reconstruct, Xs, Zs),
    flatten(Zs, Ys).
