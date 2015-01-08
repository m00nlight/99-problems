count_leaves(nil, 0) :- !.
count_leaves(t(_, nil, nil), 1) :- !.
count_leaves(t(_, Left, Right), C) :-
	count_leaves(Left, L),
	count_leaves(Right, R),
	C is L + R.

collect_leaves(nil, Acc, Acc) :-!.
collect_leaves(t(X, nil, nil), Acc, [X|Acc]) :- !.
collect_leaves(t(_, Left, Right), Acc, Xs) :-
	collect_leaves(Left, Acc, Ys),
	collect_leaves(Right, Ys, Xs).

collect_leaves(Tree, Xs) :- collect_leaves(Tree, [], Xs).


