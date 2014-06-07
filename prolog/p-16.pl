:- ensure_loaded('take-drop').

drop_every([], _, []).
drop_every(Xs, N, Ys) :-
    N > 0, N1 is N - 1,
    take(N1, Xs, P1),
    drop(N, Xs, P),
    drop_every(P, N, P2),
    append(P1, P2, Ys), !.
