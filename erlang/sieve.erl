-module(sieve).
-export([primes/1]).

primes(N) ->
    work(lists:seq(2, N)).

work([]) ->
    [];
work([P|Xs]) ->
    Ys = work([X || X <- Xs,
		    X rem P =/= 0]),
    [P|Ys].
