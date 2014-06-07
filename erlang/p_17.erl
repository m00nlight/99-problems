-module(p_17).
-export([split_at/2]).
-import(take_drop, [take/2, drop/2]).

split_at(_, N) when N < 0 ->
    erlang:error(negative);
split_at(L, N) ->
    [take(L, N), drop(L, N)].
