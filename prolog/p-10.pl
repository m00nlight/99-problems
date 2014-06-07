:- ensure_loaded('p-09').

change([H|T], [Len,H]) :-
    length([H|T], Len).
encode(Xs, Ys) :-
    pack(Xs, Zs),
    maplist(change, Zs, Ys).
