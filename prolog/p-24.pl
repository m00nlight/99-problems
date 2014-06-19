:- ensure_loaded('take-drop').

diff_select(N, M, Ans) :-
    findall(X, between(1, M, X), Xs),
    random_permutation(Xs, Ys),
    take(N, Ys, Ans).
