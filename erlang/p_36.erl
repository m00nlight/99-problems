-module(p_36).
-export([prime_factors_mult/1]).
-import(p_35, [prime_factors/1]).
-import(p_09, [pack/1]).

prime_factors_mult(N) ->
    Xs = prime_factors(N),
    Ys = pack(Xs),
    lists:map(fun ([Z|Zs]) -> {Z, length(Zs) + 1} end, Ys).
