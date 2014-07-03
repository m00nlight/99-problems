and' = (&&)
or'  = (||)

nand a b = not (and' a b)
nor a b  = not (or' a b)
impl a b = or' (not a) b
equ' a b = a == b

table2 :: (Bool -> Bool -> Bool) -> IO ()
table2 f = mapM_ putStrLn [show a ++ " " ++ show b ++ " " ++ show (f a b)
                               | a <- [True, False], b <- [True, False]]
