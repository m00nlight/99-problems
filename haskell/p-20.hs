import Data.List

removeAt :: Int -> [a] -> [a]
removeAt n lst
    | n < 0     = error "negative index"
    | otherwise = take (n - 1) lst ++ drop n lst
