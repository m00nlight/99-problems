import Data.List

data EncodeType a = Single a | Multiple Int a deriving (Show)

encode' :: Eq a => [a] -> [(Int, a)]
encode' = foldr helper []
    where
      helper x []     = [(1, x)]
      helper x (y@(a,b):ys)
          | x == b    = (1 + a, x):ys
          | otherwise = (1, x):y:ys

encodeDirect :: Eq a => [a] -> [EncodeType a]
encodeDirect = map helper . encode'
    where
      helper (1, x) = Single x
      helper (n, x) = Multiple n x


-- some test

-- *Main> encodeDirect "abcd"
-- [Single 'a',Single 'b',Single 'c',Single 'd']
-- *Main> encodeDirect "abcdd"
-- [Single 'a',Single 'b',Single 'c',Multiple 2 'd']
