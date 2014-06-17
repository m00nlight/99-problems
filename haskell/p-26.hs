

combinations :: (Eq a, Num a) => a -> [t] -> [[t]]
combinations k [] = []
combinations 1 (x:xs) = [[x]] ++ (combinations 1 xs)
combinations k (x:xs) = (map (\ l -> x:l) (combinations (k - 1) xs)) ++
                        (combinations k xs)
