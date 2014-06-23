:- ensure_loaded('p-09').
:- ensure_loaded('p-35').

change([X|Xs], Res) :-
    length([X|Xs], L), Res = X-L.

prime_factors_mult(N, Ans) :-
    prime_factors(N, Xs),
    pack(Xs, Ys),
    maplist(change, Ys, Ans).
