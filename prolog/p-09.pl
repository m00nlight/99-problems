
split_list(Zs, X, Xs, Ys) :-
    split_list(Zs, X, Xs, Ys, [], []).

split_list([], _, Xs, Ys, Xs, Ys).
split_list([Y|T], X, Xs, Ys, AccX, _) :-
    X \= Y, Xs = AccX, Ys = [Y|T].
split_list([X|T], X, Xs, Ys, AccX, AccY) :-
    split_list(T, X, Xs, Ys, [X|AccX], AccY).


pack([], []) :- !.
pack([H|T], Res) :-
    split_list([H|T], H, Xs, Ys), !,
    pack(Ys, Rt),
    Res = [Xs|Rt].
    
