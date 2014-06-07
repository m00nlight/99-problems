import Data.List

rotate :: [a] -> Int -> [a]
rotate l n
    | n < 0     = rotate l (n `mod` length l + length l)
    | otherwise = let n' = n `mod` length l
                  in reverse $ (reverse $ take n' l) ++ (reverse $ drop n' l)
