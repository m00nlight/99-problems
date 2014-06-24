-module(p_40).
-export([goldbach/1]).
-import(p_31, [is_prime/1]).

goldbach(N) ->
    goldbach(N, 3).

goldbach(N, D) ->
    case {is_prime(N - D), is_prime(D)} of
	{true, true} ->
	    {D, N - D};
	_ -> goldbach(N, D + 2)
    end.
    

