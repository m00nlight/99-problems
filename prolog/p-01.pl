
my_last(_, []) :-
    fail.
my_last(X, [X]) :- !.
my_last(X, [_|Ys]) :-
    my_last(X, Ys), !.
