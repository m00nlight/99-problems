-module(p_11).
-import(p_10, [encode/1]).
-export([encode_modify/1]).
-import(lists, [map/2]).


encode_modify(L) ->
    map(fun ([N, E]) -> if 1 =:= N -> E;
			   true -> [N, E]
			end
	end, encode(L)).
