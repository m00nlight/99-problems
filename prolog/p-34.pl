:- ensure_loaded('p-33').

totient(N, Ans) :-
    N1 is N - 1,
    findall(X, (between(1, N1, X), comprime(N, X)), L),
    length(L, Ans).
