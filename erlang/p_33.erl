-module(p_33).
-export([comprime/2]).
-import(p_32, [gcd/2]).

comprime(A, B) ->
    gcd(A, B) =:= 1.
