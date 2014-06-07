import Data.List

slice :: [a] -> Int -> Int -> [a]
slice [] _ _ = []
slice lst n1 n2
    | n1 > 0 && n2 > 0 && n1 <= n2 = take (n2 - n1 + 1) (drop (n1 - 1) lst)
    | otherwise = error "error argument"
