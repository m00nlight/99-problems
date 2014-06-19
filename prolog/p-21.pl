:- ensure_loaded('take-drop').

insert_at(Elem, Xs, N, Ys) :-
    length(Xs, L), L1 is L + 1, N1 is N - 1, N > 0 , N =< L1,
    take(N1, Xs, X1s), drop(N1, Xs,X2s),
    append([X1s, [Elem], X2s], Ys).
