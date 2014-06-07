
compress(Xs, Ys) :-
    compress(Xs, Zs, []), reverse(Ys, Zs).

compress([], Acc, Acc).
compress([X], [X|Acc], Acc).
compress([X,Y|Zs], Res, Acc) :-
    X \= Y, compress([Y|Zs], Res, [X|Acc]).
compress([X,X|Zs], Res, Acc) :-
    compress([X|Zs], Res, Acc).


