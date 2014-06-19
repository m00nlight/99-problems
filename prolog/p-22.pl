
range(A, B, L) :-
    findall(X, between(A, B, X), L).
