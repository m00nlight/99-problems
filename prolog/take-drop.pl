%% file: take_drop.pl
take(N, Xs, Ys) :-
    N >= 0, take(N, Xs, Zs, []), reverse(Zs, Ys).

take(_, [], Acc, Acc).
take(0, _, Acc, Acc).
take(N, [H|T], Ys, Acc) :-
    N >= 1, N1 is N - 1, take(N1, T, Ys, [H|Acc]), !.


drop(0, Xs, Xs).
drop(_, [], []).
drop(N, [_|T], Ys) :-
    N >= 0, N1 is N - 1, drop(N1, T, Ys), !.
    
