
isPrime :: Integral a => a -> Bool
isPrime 2 = True
isPrime 3 = True
isPrime n =
    all (\ x -> x /= 0)
        [n `mod` x | x <- [2..(truncate $ sqrt (fromIntegral n) + 1)]]

goldbach :: (Integral t, Integral t1) => t1 -> (t, t1)
goldbach n = goldbach' 3 (n - 3)
    where
      goldbach' a b
          | isPrime a && isPrime b = (a, b)
          | otherwise              = goldbach' (a + 2) (b - 2)
