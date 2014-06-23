
primeFactors :: Integral a => a -> [a]
primeFactors n = primeFactors' n 2
    where
      primeFactors' 1 _    = []
      primeFactors' n f
          | n `mod` f == 0 = f : primeFactors' (n `div` f) f
          | otherwise      = primeFactors' n (f + 1)
