:- ensure_loaded('p-10').

transform([1, E], E) :- !.
transform([N, E], [N, E]) :- !.

encode_modify(Xs, Ys) :-
    encode(Xs, Zs),
    maplist(transform, Zs, Ys).

