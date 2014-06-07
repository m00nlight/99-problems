-module(p_04).
-export([my_length/1]).

my_length(L) ->
    my_length(L, 0).

my_length([], Acc) ->
    Acc;
my_length([_|T], Acc) ->
    my_length(T, Acc+1).


    
