:- ensure_loaded('take-drop').

slice([], _, _, []).

slice(Xs, N1, N2, Ys) :-
    N1 > 0, N2 > 0, N1 =< N2,
    drop(N1, Xs, Tail),
    N is N2 - N1,
    take(N, Tail, Ys).
