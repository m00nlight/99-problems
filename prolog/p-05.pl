
my_reverse(X, Rev) :-
    my_reverse(X, [], Rev).

my_reverse([], Rev, Rev).
my_reverse([H|T], Prev, Rev) :-
    my_reverse(T, [H|Prev], Rev).
