:- ensure_loaded('p-40').

goldbach_list(A, B, Ans) :-
    findall(Y, (between(A, B, X), X mod 2 =:= 0, goldbach(X, Y)), Ans).

goldbach_list2(A, B, Thresh, Ans) :-
    goldbach_list(A, B, Xs),
    findall(P-Q, (member(P-Q, Xs), P >= Thresh, Q >= Thresh), Ans).

%% ?- goldbach_list(9, 20, Ans).
%% Ans = [3-7, 5-7, 3-11, 3-13, 5-13, 3-17].

%% ?- goldbach_list2(4, 2000, 50, Ans).
%% Ans = [73-919, 61-1321, 67-1789, 61-1867].

