:- ensure_loaded('p-17').

rotate(Xs, N, Ys) :-
    N < 0, length(Xs, L), N1 is mod(N, L),
    N2 is L + N1, rotate(Xs, N2, Ys), !.
rotate(Xs, N, Ys) :-
    N > 0, length(Xs, L), N1 is mod(N, L),
    split(Xs, N1, L1, L2),
    reverse(L1, P1),
    reverse(L2, P2),
    append(P1, P2, Zs), reverse(Ys, Zs), !.
    
