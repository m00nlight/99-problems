
gray :: (Eq a, Num a) => a -> [[Char]]
gray 0 = [""]
gray n =
    let temp = gray $ n - 1
    in map (\ x -> "0" ++ x) temp ++
       map (\ x -> "1" ++ x) temp
