-module(p_01).
-export([my_last/1]).

my_last([]) ->
    erlang:error(empty);
my_last([X]) ->
    X;
my_last([H|T]) ->
    my_last(T).



    

