internals(Tree, Xs) :- internals(Tree, [], Xs).

internals(nil, Acc, Acc) :- !.
internals(t(_,nil,nil), Acc, Acc) :- !.
internals(t(X, Left, Right), Acc, Xs) :-
	internals(Left, Acc, Ys),
	internals(Right, Ys, Zs),
	Xs = [X|Zs].

