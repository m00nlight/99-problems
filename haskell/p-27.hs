import qualified Data.List as D

combinations :: (Eq a, Num a) => a -> [t] -> [[t]]
combinations k [] = []
combinations 1 (x:xs) = [[x]] ++ (combinations 1 xs)
combinations k (x:xs) = (map (\ l -> x:l) (combinations (k - 1) xs)) ++
                        (combinations k xs)

myGroup [] [] = [[]]
myGroup (n:ns) xs =
    [x : y | x <- combinations n xs, y <- myGroup ns (xs D.\\ x)]

-- *Main> length $ myGroup [2,3,4] ["aldo","beat","carla","david","evi","flip","gary","hugo","ida"]
-- 1260
-- *Main> length $ myGroup [2,2,5] ["aldo","beat","carla","david","evi","flip","gary","hugo","ida"]
-- 756
