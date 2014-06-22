-module(p_24).
-export([diff_select/2]).
-import(take_drop, [take/2,drop/2]).

diff_select(N, M) ->
    diff_select(lists:seq(1, N), M, []).

diff_select(_, 0, Acc) ->
    Acc;
diff_select(L, M, Acc) ->
    Nth = random:uniform(length(L)),    
    X = lists:nth(Nth, L),
    L1 = take(L, Nth - 1) ++ drop(L, Nth),
    diff_select(L1, M - 1, [X|Acc]).

    
