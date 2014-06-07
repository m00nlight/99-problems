-module(p_19).
-export([rotate/2]).
-import(p_17, [split_at/2]).
-import(lists, [reverse/1, append/2]).

rotate(L, N) when N < 0 ->
    rotate(L, N rem length(L) + length(L));
rotate(L, N) when N > 0 ->
    X = N rem length(L),
    [P, Q] = split_at(L, X),
    [Pr, Qr] = [reverse(P), reverse(Q)],
    reverse(append(Pr, Qr)).
