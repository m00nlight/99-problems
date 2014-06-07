-module(p_16).
-export([drop_nth/2]).
-import(take_drop, [take/2, drop/2]).
-import(lists, [append/2]).

drop_nth(_, N) when N < 0 ->
    erlang:error(negative);
drop_nth([], _) -> [];
drop_nth(Xs, N) ->
    append(take(Xs, N-1), drop_nth(drop(Xs, N), N)).



