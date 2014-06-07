-module(p_09).
-export([pack/1]).
-import(lists, [takewhile/2,dropwhile/2]).

pack([]) ->
    [];
pack([H|T]) ->
    P1 = takewhile(fun (X) -> X == H end,[H|T]),
    P2 = dropwhile(fun (X) -> X == H end,[H|T]),
    [P1|pack(P2)].
			  
