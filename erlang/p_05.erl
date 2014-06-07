-module(p_05).
-export([my_reverse/1]).

my_reverse(L) ->
    my_reverse(L, []).

my_reverse([], Acc) ->
    Acc;
my_reverse([H|T], Acc) ->
    my_reverse(T, [H|Acc]).


%% 22> p_05:my_reverse([1,2,3,4]).
%% [4,3,2,1]
%% 23> p_05:my_reverse([1,[2,3],4]).
%% [4,[2,3],1]

