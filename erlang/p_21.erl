-module(p_21).
-export([insert_at/3]).
-import(take_drop, [take/2, drop/2]).


insert_at(Elem, L, N) when (N > 0) and (N =< length(L) + 1) -> 
    take(L, N - 1) ++ [Elem] ++ drop(L, N - 1).
