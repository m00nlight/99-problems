-module(p_06).
-export([is_palindrome/1]).

is_palindrome(L) ->
    lists:reverse(L) == L.

%% 27> p_06:is_palindrome([1,2,3,2,1]).
%% true
%% 28> p_06:is_palindrome([1,2,3,2,1,3]).
%% false
