import Data.List

split :: [a] -> Int -> [[a]]
split [] _      = [[],[]]
split lst n
    | n < 0     = error "negative index error"
    | otherwise = [take n lst, drop n lst]
