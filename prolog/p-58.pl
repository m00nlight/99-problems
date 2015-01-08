:- ensure_loaded('p-55').
:- ensure_loaded('p-56').

sym_cbal_tree(N, Ts) :-
	findall(X, (cbal_tree(N, X), symmetric(X)), Ts).
