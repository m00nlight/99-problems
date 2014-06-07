-module(p_15).
-export([dupli/2]).
-import(lists, [map/2, flatmap/2, seq/2]).

repeat(N, E) ->
    [E || _ <- seq(1, N)].

dupli(L, N) when N >= 0 ->
    flatmap(fun (X) -> repeat(N, X) end, L);
dupli(_, N) when N < 0 ->
    erlang:error(negative).
    
