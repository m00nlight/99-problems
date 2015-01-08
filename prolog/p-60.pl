:- ensure_loaded('p-59').

max_node(H, N) :- N is 2 ** H - 1.

min_node(0, 0) :- !.
min_node(1, 1) :- !.
min_node(H, N) :-
	H > 1, H1 is H - 1, H2 is H - 2,
	min_node(H1, N1), min_node(H2, N2),
	N is N1 + N2 + 1.

min_height(N, H, CurrH) :-
	max_node(CurrH, N1),
	(   N1 < N
	->  CurrH1 is CurrH + 1, min_height(N, H, CurrH1)
	;   H = CurrH
	).

min_height(N, H) :- min_height(N, H, 1).

max_height(N, H, CurrH) :-
	min_node(CurrH, N1),
	(   N1 < N
	->  CurrH1 is CurrH + 1, max_height(N, H, CurrH1)
	;   H = CurrH
	).

max_height(N, H) :- max_height(N, H, 1).

count_nodes(nil, 0) :- !.
count_nodes(t(_, Left, Right), Res) :-
	count_nodes(Left, L),
	count_nodes(Right, R),
	Res is L + R + 1.

hbal_tree_nodes(N,T) :-
	min_height(N, Low), max_height(N, High),
	between(Low, High, X),
	hbal_tree(X, T), count_nodes(T, N).


count_hbal_trees(N, C) :-
	setof(T, hbal_tree_nodes(N, T), Rs),
	length(Rs, C).
