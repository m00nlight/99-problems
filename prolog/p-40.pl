:- ensure_loaded('p-31').

goldbach(N, Ans) :-
    goldbach(N, 3, Ans).

goldbach(N, M1, Ans) :-
    M2 is N - M1,
    is_prime(M1), is_prime(M2), !, Ans = M1-M2.
goldbach(N, M, Ans) :-
    M2 is M + 2,
    goldbach(N, M2, Ans).
    
