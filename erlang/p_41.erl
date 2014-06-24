-module(p_41).
-export([goldbach_list/2, goldbach_list/3]).
-import(p_40, [goldbach/1]).
-import(lists, [seq/2, filter/2]).

goldbach_list(A, B) ->
    lists:map(fun (X) -> goldbach(X) end,
	      filter(fun (X) -> X rem 2 == 0 end,seq(A, B))).

goldbach_list(A, B, T) ->
    Xs = goldbach_list(A, B),
    filter(fun ({P, Q}) ->
		   (P > T) andalso (Q > T)
	   end, Xs).

%% 7> p_41:goldbach_list(9, 1000, 50).
%% [{73,919}]
%% 8> p_41:goldbach_list(9, 2000, 50).
%% [{73,919},{61,1321},{67,1789},{61,1867}]

