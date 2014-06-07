-module(p_02).
-export([my_but_last/1]).

my_but_last([]) ->
    erlang:error(empty);
my_but_last([_]) ->
    erlang:error(only_one_element);
my_but_last([X,_]) ->
    X;
my_but_last([_|T]) ->
    my_but_last(T).

