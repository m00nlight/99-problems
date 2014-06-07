my_length(Len, Ls) :- my_length(Len, 0, Ls).

my_length(Acc, Acc, []).
my_length(Len, Acc, [_|T]) :-
    Acc1 is Acc + 1,
    my_length(Len, Acc1, T), !.
