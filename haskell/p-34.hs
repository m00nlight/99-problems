
comprime a b = (gcd a b) == 1

totient n =
    length $ filter (\ x -> comprime n x) [1..(n-1)]
