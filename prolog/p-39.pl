:- ensure_loaded('p-31').

prime_range(A, B, Ans) :-
    findall(X, (between(A, B, X), is_prime(X)), Ans).
