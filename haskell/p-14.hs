
dupli :: [b] -> [b]
dupli = concatMap (\ x -> [x, x])
