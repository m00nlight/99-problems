-- negative number should be enclosed by parentheses (-3) for example
elementAt :: (Num a, Ord a) => [t] -> a -> t
elementAt (x:xs) 1 = x
elementAt [] _ = error "Index out of range"
elementAt (x:xs) k
    | k < 1 = error "Index out of range"
    | otherwise = elementAt xs (k - 1)
