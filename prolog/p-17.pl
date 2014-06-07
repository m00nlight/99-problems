:- ensure_loaded('take-drop').

split(Xs, N, Ps, Qs) :-
    N > 0,
    take(N, Xs, Ps),
    drop(N, Xs, Qs).
