-module(p_18).
-export([slice/3]).
-import(take_drop, [take/2, drop/2]).

slice(Xs, N1, N2) when N1 > 0 andalso N2 > 0 andalso N1 =< N2 ->
    take(drop(Xs, N1 - 1), N2 - N1 + 1);
slice(_, _, _) ->
    erlang:error(argument_error).

    

