import Data.List

repli :: [b] -> Int -> [b]
repli lst n = if n < 0
              then error "negative replicate agrument"
              else concatMap (\ x -> take n $ repeat x) lst
