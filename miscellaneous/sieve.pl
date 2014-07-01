
range(A, B, L) :-
    findall(X, between(A, B, X), L).

primes(N, Res) :-
    range(2, N, L),
    sieve(L, Res).

sieve([], []) :- !.
sieve([P|Xs], [P|Ys]) :-
    findall(X, (member(X, Xs),
		Mod is X mod P, Mod =\= 0), Zs), !,
    sieve(Zs, Ys).
