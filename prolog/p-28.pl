
cmp(Ord, S1, S2) :-
    length(S1, L1), length(S2, L2),
    compare(Ord, L1, L2).

lsort(Xs, Ys) :-
    predsort(cmp, Xs, Ys).


