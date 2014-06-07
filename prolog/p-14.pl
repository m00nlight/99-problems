
change(X, [X, X]).

dupli(Xs, Ys) :-
    maplist(change, Xs, Zs),
    append(Zs, Ys).
