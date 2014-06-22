-module(p_25).
-export([rnd_permu/1]).
-import(take_drop, [take/2, drop/2]).

rnd_permu([]) ->
    [];
rnd_permu([X|Xs]) ->
    Nth = random:uniform(length([X|Xs])),
    Ys = rnd_permu(Xs),
    take(Ys, Nth - 1) ++ [X] ++ drop(Ys, Nth - 1).

    


