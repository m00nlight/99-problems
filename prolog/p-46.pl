%% and([A, B], true) :- A, B, !.
%% and([_, _], false).

%% or([A, _], true) :- A, !.
%% or([_, B], Ans) :- Ans = B.

%% nand([A, B], Ans) :-
%%     and([A, B], TempAns),
%%     Ans = not(TempAns).

%% nor([A, B], Ans) :-
%%     or([A, B], TempAns),
%%     Ans = not(TempAns).

%% xor([A, B], Ans) :-
%%     and([not(A), B], T1),
%%     and([A, not(B)], T2),
%%     or([T1, T2], Ans).

%% impl([A, B], Ans) :-
%%     or([not(A), B], Ans).

%% equ([A, B], Ans) :-
%%     Ans = (A == B).

and(A, B) :- A, B.
or(A, _) :- A, !.
or(_, B) :- B.

nand(A, B) :-
    not(and(A, B)).

nor(A, B) :-
    not(or(A, B)).

xor(A, B) :-
    or(and(not(A), B)), and(A, not(B)).

impl(A, B) :-
    or(not(A), B).

equ(A, B) :-
    A == B.

bind(true).
bind(false).

table(A, B, Expr) :-
    bind(A), bind(B), eval(A, B, Expr), fail.

eval(A, B, _) :-
    write(A), write(' '), write(B), write(' ').
eval(_, _, Expr) :-
    Expr, !, write(true), nl.
eval(_, _, _) :-
    write(false), nl.
    
