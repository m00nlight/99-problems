-module(p_10).
-import(p_09, [pack/1]).
-export([encode/1]).
-import(lists, [map/2]).

encode(L) ->
    map(fun ([H|T]) -> [length([H|T]),H] end, pack(L)). 


%% 55> p_10:encode([a,a,a,a,b,c,c,a,a,a,d,e,e,e,e,e]).
%% [[4,a],[1,b],[2,c],[3,a],[1,d],[5,e]]

		

