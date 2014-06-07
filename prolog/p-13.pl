
foldr(_, [], V0, V0).
foldr(G, [H|T], V0, V) :-
    foldr(G, T, V0, V1),
    apply(G, [H, V1, V]).

transform(X, [], [[1, X]]).
transform(X ,[[N,X]|Xs], [[N1, X]|Xs]) :-
    N1 is N + 1.
transform(X, [[N,Y]|Ys], [[1, X], [N, Y]|Ys]) :-
    X \= Y.

change([1, E], E) :- !.
change([N, E], [N, E]) :- !.
    
encode_direct(Xs, Ys) :-
    foldr(transform, Xs, [], Zs),
    maplist(change, Zs, Ys), !.
