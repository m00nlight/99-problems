import Data.List

dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery lst n
    | n < 0 = error "negative index number"
    | otherwise = take (n - 1) lst ++ dropEvery (drop n lst) n
