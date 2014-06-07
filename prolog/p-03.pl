
element_at(N, X, [X|_]) :- N == 1, !.
element_at(_, _, []) :-
    fail, !.
element_at(N, _, [_|_]) :- N < 1, fail, !.
element_at(N, X, [_|Xs]) :-
    N1 is N - 1, element_at(N1, X, Xs), !.
			 
