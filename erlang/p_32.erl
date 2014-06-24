-module(p_32).
-export([gcd/2]).


gcd(A, 0) ->
    abs(A);
gcd(0, B) ->
    abs(B);
gcd(A, B) ->
    gcd(B, A rem B).





