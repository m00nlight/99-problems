-module(p_20).
-export([remove_at/2]).
-import(take_drop, [take/2, drop/2]).
-import(lists, [append/2]).

remove_at(L, N) when N > 0 ->
    append(take(L, N - 1), drop(L, N)); 
remove_at(_, N) when N < 0 ->
    erlang:error(negative_index).
