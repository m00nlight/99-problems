:- ensure_loaded('p-47').

bind_list([]).
bind_list([X|Xs]) :-
    bind(X), bind_list(Xs).

write_var_list([]).
write_var_list([V|Vs]) :-
    write(V), write(' '), write_var_list(Vs).

write_expr(Expr) :- Expr, !, write(true).
write_expr(_) :- write(false).

eval_var_list(VarList, Expr) :-
    write_var_list(VarList),
    write_expr(Expr),
    nl.

table(VarList, Expr) :-
    bind_list(VarList),
    eval_var_list(VarList, Expr),
    fail.

%% ?- table([A,B,C], A or (B and C)).
%% true true true true
%% true true false true
%% true false true true
%% true false false true
%% false true true true
%% false true false false
%% false false true false
%% false false false false
%% false.
