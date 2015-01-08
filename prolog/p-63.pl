complete_binary_tree(0, nil) :- !.
complete_binary_tree(1, t(x, nil, nil)) :- !.
complete_binary_tree(N, Tree) :-
	N1 is N - 1,
	complete_binary_tree(N1, Sub),
	Tree = t(x, Sub, Sub).
