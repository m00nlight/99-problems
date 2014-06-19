

cons(X, Xs, [X|Xs]) :-!.

combinations(_, [], []) :- !.
combinations(1, [X|Xs], Ys) :-
    combinations(1, Xs, Zs), append([[X]], Zs, Ys), !.
combinations(N, [X|Xs], Ys) :-
    N > 0, N1 is N - 1, !,
    combinations(N, Xs, Ps),
    combinations(N1,Xs, Qs),
    maplist(cons(X), Qs, Rs),
    append(Ps, Rs, Ys).
