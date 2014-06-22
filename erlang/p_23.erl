-module(p_23).
-export([rnd_select/2]).

rnd_select(L, N) when N > 0 ->
    rnd_select(L, N, []).

rnd_select(_, 0, Acc) ->
    Acc;
rnd_select(L, N, Acc) ->
    X = lists:nth(random:uniform(length(L)), L),
    rnd_select(L, N - 1, [X|Acc]).    
