-module(p_34).
-export([totient/1]).
-import(p_33, [comprime/2]).
-import(lists, [seq/2, filter/2]).

totient(N) ->
    length(filter(fun (X) -> comprime(X, N) end, seq(1, N-1))).
