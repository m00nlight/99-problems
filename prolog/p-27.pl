:- ensure_loaded('p-26').

cons(X, Xs, [X|Xs]) :- !.


fun(X, Ys, Ans) :-
    maplist(cons(X), Ys, Ans).

group([], [], [[]]) :- !.
group([N|Ns], Xs, Ys) :-
    combinations(N, Xs, Zs),
    maplist(subtract(Xs), Zs, Ps),
    maplist(group(Ns), Ps, Rs),
    maplist(fun, Zs, Rs, Qs),
    append(Qs, Ys).
    


test(Ns, Xs, Expected) :-
    group(Ns, Xs, Ys),
    length(Ys, Expected).
