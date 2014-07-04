
cons(H, T, [H|T]).

gray(0, [[]]) :- !.
gray(N, Ans) :-
    N > 0, N1 is N - 1, !,
    gray(N1, Temp),
    maplist(cons(0), Temp, T1),
    maplist(cons(1), Temp, T2),
    append(T1, T2, Ans).


