myGCD :: Integral a => a -> a -> a
myGCD a 0 = abs a
myGCD 0 b = abs b
myGCD a b = myGCD b (a `mod` b)
