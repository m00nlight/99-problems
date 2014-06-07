
is_palindrome(X) :-
    reverse(X, Xrev), Xrev == X.
