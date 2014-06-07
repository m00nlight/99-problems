
myLength :: Num a => [t] -> a
myLength = myLength' 0
    where myLength' acc [] = acc
          myLength' acc (x:xs) = myLength' (acc + 1) xs
