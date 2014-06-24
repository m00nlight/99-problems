-module(p_35).
-export([prime_factors/1]).

prime_factors(N) ->
    prime_factors(N, 2, []).
    

prime_factors(1, _, Acc) ->
    lists:reverse(Acc);
prime_factors(N, D, Acc) when N rem D == 0 ->
    prime_factors(N div D, D, [D|Acc]);
prime_factors(N, D, Acc) when N rem D /= 0 ->
    prime_factors(N, D + 1, Acc).

