import qualified Data.List as L

primeFactorsMult :: Integral a => a -> [(a, Int)]
primeFactorsMult n = map (\ x -> (head x, length x)) $ L.group (help n 2)
    where
      help 1 _             = []
      help n f
          | n `mod` f == 0 = f : help (n `div` f) f
          | otherwise      = help n (f + 1)
