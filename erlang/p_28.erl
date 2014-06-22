-module(p_28).
-export([lsort/1, lfsort/1]).
-import(p_09, [pack/1]).


lsort(Xs) ->
    lists:sort(fun(X, Y) ->
		       length(X) < length(Y)
	       end, Xs).

lfsort(Xs) ->
    Ls = lists:map(fun (X) -> length(X) end, Xs),
    Gs = p_09:pack(lists:sort(Ls)),
    Lf = maps:from_list(lists:map(fun([Y|Ys]) ->
					  {Y, length([Y|Ys])}
				  end, Gs)),
    lists:sort(fun (X, Y) ->
		       maps:get(length(X), Lf) < maps:get(length(Y), Lf)
	       end, Xs).


%% 133> p_28:lfsort(["a", "b", "c", "de", "fg", "ijk"]).
%% ["ijk","fg","de","c","b","a"]

