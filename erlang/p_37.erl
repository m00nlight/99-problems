-module(p_37).
-export([phi/1]).
-import(p_36, [prime_factors_mult/1]).

pow(_, 0) ->
    1;
pow(A, 1) ->
    A;
pow(A, B) when B rem 2 == 0 ->
    Temp = pow(A, B div 2),
    Temp * Temp;
pow(A, B) ->
    Temp = pow(A, B div 2),
    Temp * Temp * A.

phi(N) ->
    Xs = prime_factors_mult(N),
    lists:foldl(fun ({P, M}, Acc) ->
			Acc * (P - 1) * pow(P, M - 1)
		end, 1, Xs).
