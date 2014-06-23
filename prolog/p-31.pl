
mod(N, M, Res) :- Res is N mod M.

is_prime(2) :- !.
is_prime(3) :- !.
is_prime(X) :-
    sqrt(X, Temp), Temp1 is Temp + 1, Limit is round(Temp1),
    findall(N, between(2, Limit, N), PP),
    maplist(mod(X), PP, L),
    not(member(0, L)).
