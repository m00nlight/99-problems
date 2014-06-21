len_str(X, P) :-
    length(X, L), P = L-X.

lsort(Xs, Ys) :-
    maplist(len_str, Xs, Zs),
    keysort(Zs, Ps),
    pairs_values(Ps, Ys).

%% some test
%% ?- lsort(["abc", "de", "fgh", "ae"], Ys).
%% Ys = [[100, 101], [97, 101], [97, 98, 99], [102, 103, 104]].

%% ?- lsort(["abc", "de", "fgh", "ae", "a"], Ys).
%% Ys = [[97], [100, 101], [97, 101], [97, 98, 99], [102, 103, 104]].

    
transform(_-Xs, F-Xs) :-
    length(Xs, F).

lfsort(Xs, Ys) :-
    map_list_to_pairs(length, Xs, Ps),
    group_pairs_by_key(Ps, Qs),
    maplist(transform, Qs, Ts),
    keysort(Ts, Zs),
    pairs_values(Zs, As),
    append(As, Ys).

%% ?- lfsort(["a", "b", "c", "de", "fg", "ijk"], Ys).
%% Ys = [[105, 106, 107], [100, 101], [102, 103], [97], [98], [99]].

    
