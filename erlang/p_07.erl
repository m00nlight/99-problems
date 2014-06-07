-module(p_07).
-export([my_flatten/1]).

my_flatten([]) ->
    [];
my_flatten([H|T]) ->
    my_flatten(H) ++ my_flatten(T);
my_flatten(H) ->
    [H].


    
