and' = (&&)
or'  = (||)

nand a b = not (and' a b)
nor a b  = not (or' a b)
impl a b = or' (not a) b
equ' a b = a == b



powerSet :: (Eq a, Num a) => a -> [[Bool]]
powerSet 0 = [[]]
powerSet n =
    let temp = powerSet (n - 1)
    in map (\ x -> (True:x)) temp ++
       map (\ x -> (False:x)) temp

tablen n f =
    let trueTable = powerSet n
    in mapM_ putStrLn [show x ++ " " ++ show (f x)
                            | x <- trueTable]
