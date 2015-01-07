insert_bst(X, nil, t(X, nil, nil)) :- !.
insert_bst(X, t(Y, L, R), Res) :-
	(   X < Y
	->  insert_bst(X, L,Res1), Res = t(Y, Res1, R)
	;   insert_bst(X, R, Res1), Res = t(Y, L, Res1)
	).


construct(Xs, T) :-
	foldl(insert_bst, Xs, nil, T).
