-module(p_39).
-export([prime_range/2]).
-import(p_31, [is_prime/1]).

prime_range(A, B) ->
    [X || X <- lists:seq(A, B),
	  is_prime(X)].
