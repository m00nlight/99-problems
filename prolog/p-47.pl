:- ensure_loaded('p-46').

:- op(900, fy,not).
:- op(910, yfx, and).
:- op(910, yfx, nand).
:- op(920, yfx, or).
:- op(920, yfx, nor).
:- op(930, yfx, impl).
:- op(930, yfx, equ).
:- op(930, yfx, xor).



%% ?- table(A,B, A and (A or not B)).
%% true true true
%% true false true
%% false true false
%% false false false
%% false.
