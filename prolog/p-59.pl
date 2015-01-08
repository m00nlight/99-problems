hbal_tree(0, nil) :- !.
hbal_tree(1, t(x, nil, nil)) :- !.
hbal_tree(N, T) :-
	N >= 2, N1 is N - 1, N2 is N - 2,
	distrib(N1, N2, NL, NR),
	hbal_tree(NL, Left),
	hbal_tree(NR, Right),
	T = t(x, Left, Right).

distrib(N1, _, N1, N1).
distrib(N1, N2, N1, N2).
distrib(N1, N2, N2, N1).
