
insertAt :: a -> [a] -> Int -> [a]
insertAt e xs k = insertAt' e [] xs k
    where
      insertAt' e acc [] k = reverse acc
      insertAt' e acc (y:ys) 1 = insertAt' e (y:e:acc) ys 0
      insertAt' e acc (y:ys) k = insertAt' e (y:acc) ys (k - 1)


-- *Main> insertAt 'X' "abcd" 4
-- "abcXd"
-- *Main> insertAt 'X' "abcd" 5
-- "abcd"
-- *Main> insertAt 'X' "abcd" 6
-- "abcd"
-- *Main> insertAt 'X' "abcd" 1
-- "Xabcd"
-- *Main> insertAt 'X' "abcd" 2
-- "aXbcd"
