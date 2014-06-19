
rnd_select(_, 0, []) :- !.
rnd_select(Xs, N, [X|Zs]) :-
    N > 0, N1 is N - 1, !,
    rnd_select(Xs, N1, Zs),
    random_member(X, Xs).
