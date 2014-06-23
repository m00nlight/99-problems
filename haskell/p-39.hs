
isPrime :: Integral a => a -> Bool
isPrime 2 = True
isPrime 3 = True
isPrime n =
    all (\ x -> x /= 0)
        [n `mod` x | x <- [2..(truncate $ sqrt (fromIntegral n) + 1)]]

primeR :: Integral a => a -> a -> [a]
primeR a b =
    filter isPrime [a..b]
