-module(p_13).
-export([encode_direct/1]).

encode_direct([], Acc, _) ->
    lists:reverse(Acc);
encode_direct([X],Acc, N) ->
    if N > 1 -> encode_direct([], [[N, X]|Acc], 1);
       N == 1 -> encode_direct([], [X|Acc], 1)
    end;	    
encode_direct([X,Y|Xs], Acc, N)
  when X /= Y andalso N == 1 ->
    encode_direct([Y|Xs], [X|Acc], 1);
encode_direct([X,Y|Xs], Acc, N)
  when X /= Y andalso N /= 1 ->
    encode_direct([Y|Xs], [[N, X]|Acc], 1);
encode_direct([X,X|Xs], Acc, N) ->
    encode_direct([X|Xs], Acc, N + 1).

encode_direct(L) ->
    encode_direct(L, [], 1).


