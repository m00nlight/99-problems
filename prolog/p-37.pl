:- ensure_loaded('p-36').

transform(P-M, Acc, Res) :-
    P1 is P - 1, M1 is M - 1,
    Res is Acc * P1 * P1 ^ M1.

phi(N, Ans) :-
    prime_factors_mult(N, Xs),
    foldl(transform, Xs, 1, Ans).
