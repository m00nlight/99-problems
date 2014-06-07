-module(p_03).
-export([element_at/2]).

element_at(_, K) when K=<0 ->
    erlang:error(index_error);
element_at([], K) when K>1 ->
    erlang:error(index_out_range);
element_at([X|_], 1) ->
    X;
element_at([_|T], K) when K>1 ->
    element_at(T, K - 1).



