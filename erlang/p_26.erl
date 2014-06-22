-module(p_26).
-export([combinations/2]).

combinations(_, []) ->
    [];
combinations(1, Xs) ->
    [[X] || X <- Xs];
combinations(M, [X|Xs]) ->
    X1 = [[X|Ys] || Ys <- combinations(M-1, Xs)],
    X2 = [Ys || Ys <- combinations(M, Xs)],
    X1 ++ X2.
