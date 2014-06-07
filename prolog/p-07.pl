
%% my_flatten(Xs, Res) :-
%%     my_flatten(Xs,R, []), reverse(Res, R).

%% my_flatten([], Acc, Acc) :- !.
%% my_flatten([H|T], Res, Acc) :-
%%     is_list(H), !,
%%     my_flatten(H, Rh, Acc),
%%     my_flatten(T, Res, Rh).
%% my_flatten([H|T], Res, Acc) :-
%%     my_flatten(T, Res, [H|Acc]).

my_flatten([], []).
my_flatten([H|T], Res) :- is_list(H), !,
    my_flatten(H, H1), my_flatten(T, T1), append(H1, T1, Res).
my_flatten([H|T], [H|T1]) :-
    my_flatten(T, T1).
    

%% ?- my_flatten([1,[2,[3,4],5],6], Res).
%% Res = [1, 2, 3, 4, 5, 6] ;
%% false.
