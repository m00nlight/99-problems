-module(p_14).
-export([dupli/1]).
-import(lists, [map/2, flatmap/2]).

dupli(L) ->
    flatmap(fun (X) -> [X, X] end, L).
