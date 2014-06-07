-module(p_08).
-export([compress/1]).

compress(L) ->
    lists:reverse(compress(L, [])).

compress([], Acc) -> Acc;
compress([X], Acc) ->
    [X|Acc];
compress([X, X|Xs], Acc) ->
    compress([X|Xs], Acc);
compress([X, Y|Ys], Acc) when(X =/= Y) ->
    compress([Y|Ys], [X|Acc]).


