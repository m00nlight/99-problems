
my_but_last(_, []) :-
    fail, !.
my_but_last(_, [_]) :-
    fail, !.
my_but_last(X, [X,_]) :- !.
my_but_last(X, [_,Y|Ys]) :-
    my_but_last(X, [Y|Ys]), !.
