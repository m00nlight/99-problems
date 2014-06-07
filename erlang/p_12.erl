-module(p_12).
-import(p_10, [encode_modify/1]).
-export([decode/1, repeat/2]).
-import(lists, [map/2, seq/2, flatten/1]).

repeat(N, E) ->
    [E || _ <- seq(1, N)].


decode(L) ->
    flatten(
      map(fun (X) ->
		  if
		      is_atom(X) -> X;
		      is_list(X) -> apply(p_12, repeat, X)
		  end
	  end, L)).




		

