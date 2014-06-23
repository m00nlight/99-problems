
prime_factors(N, Ans) :-
    prime_factors(N, [], 2, Ans).

prime_factors(1, Acc, _, Ans) :-
    reverse(Acc, Ans), !.
prime_factors(N, Acc, F, Ans) :-
    Mod is N mod F, Mod = 0, N1 is N div F, !,
    prime_factors(N1, [F|Acc], F, Ans).
prime_factors(N, Acc, F, Ans) :-
    F1 is F + 1,
    prime_factors(N, Acc, F1, Ans).
