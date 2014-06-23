
comprime :: Integral a => a -> a -> Bool
comprime a b = (gcd a b) == 1
